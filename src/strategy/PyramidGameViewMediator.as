package strategy {
	
	import strategy.PyramidGameView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.model.transactions.StoneTransactionVO;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.events.DailyProgressEvent;
	import strategy.model.transactions.DailyProductivityVO;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.controller.events.StoneStockCheckEvent;
	
	public class PyramidGameViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:PyramidGameView;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function PyramidGameViewMediator() {			
			// Try not to put stuff in the constructor of the mediator
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			eventMap.mapListener(eventDispatcher, StoneStockCheckEvent.STOCK_STOLEN, stockStolenHandler, StoneStockCheckEvent);
			
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.STONE_OFFERED, stoneOfferedHandler, StoneSupplyEvent);
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.NO_STONE_OFFERED, noStoneOfferedHandler, StoneSupplyEvent);
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.STONE_DILEMMA, stoneDilemmaHandler, StoneSupplyEvent);

			eventMap.mapListener(eventDispatcher, LabourSupplyEvent.WORKERS_OFFERED, workersOfferedHandler, LabourSupplyEvent);

			eventMap.mapListener(eventDispatcher, DailyProgressEvent.PROGRESS_CALCULATED, progressCalculatedHandler, DailyProgressEvent);

			eventMap.mapListener(eventDispatcher, DayCycleEvent.STONE_STOCK_CHECKED, stoneStockChecked, DayCycleEvent);
			eventMap.mapListener(eventDispatcher, DayCycleEvent.STONE_DELIVERY_COMPLETED, stoneDeliveryCompletedHandler, DayCycleEvent);
			eventMap.mapListener(eventDispatcher, DayCycleEvent.LABOUR_HIRE_COMPLETED, labourHireCompletedHandler, DayCycleEvent);
			eventMap.mapListener(eventDispatcher, DayCycleEvent.DAY_ENDED, dayEndedHandler, DayCycleEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function stockStolenHandler(e:StoneStockCheckEvent):void
		{
			view.showStoneStockCheck(e.quantity);
		}
		
		private function stoneOfferedHandler(e:StoneSupplyEvent):void
		{
			var transactionVO:StoneTransactionVO = e.transactionVO;
			view.showStoneOffer(transactionVO.price, transactionVO.quantity);
		}
		
		private function noStoneOfferedHandler(e:StoneSupplyEvent):void
		{
			view.showNoStoneOffer(e.message);
		}
		
		private function stoneDilemmaHandler(e:StoneSupplyEvent):void
		{
			var transactionVO:StoneTransactionVO = e.transactionVO;
			view.showStoneDilemma(transactionVO.price, transactionVO.quantity, e.message);
		}
		
		private function workersOfferedHandler(e:LabourSupplyEvent):void
		{
			var workersVector:Vector.<WorkerProductivityVO> = e.workers;
			view.showLabourOffer(workersVector);
		}

		private function progressCalculatedHandler(e:DailyProgressEvent):void
		{
			var productivityVO:DailyProductivityVO = e.productivityVO;
			view.showEndOfDaySummary(productivityVO.stonesBuilt, productivityVO.wagesPaid);
		}
		
		private function stoneStockChecked(e:DayCycleEvent):void
		{
			view.removeStoneStockCheck();
		}

		private function stoneDeliveryCompletedHandler(e:DayCycleEvent):void
		{
			view.removeStoneOffer();
		} 
		
		private function labourHireCompletedHandler(e:DayCycleEvent):void
		{
			view.removeLabourOffer();
		}
		
		private function dayEndedHandler(e:DayCycleEvent):void
		{
			view.removeEndOfDaySummary();
		}
		
	}
}