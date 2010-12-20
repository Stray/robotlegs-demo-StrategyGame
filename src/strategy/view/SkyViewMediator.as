package strategy.view {
	
	import strategy.view.SkyView;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.utils.Dictionary;
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.events.DailyProgressEvent;
	
	public class SkyViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:SkyView;
		
		private var _skyPositionByDayEvent:Dictionary;
		
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
		
		public function SkyViewMediator() {			
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
			prepareLookups();
			mapDayEventType(DayCycleEvent.NEW_DAY_STARTED);
			mapDayEventType(DayCycleEvent.WORKING_DAY_STARTED);
			mapDayEventType(DayCycleEvent.STONE_STOCK_CHECKED);
			mapDayEventType(DayCycleEvent.STONE_DELIVERY_COMPLETED);
			mapDayEventType(DayCycleEvent.LABOUR_HIRE_COMPLETED);
			mapDayEventType(DayCycleEvent.RANDOM_EVENTS_COMPLETED);
			mapDayEventType(DayCycleEvent.PROGRESS_CALCULATED);
			mapDayEventType(DayCycleEvent.DAY_ENDED); 
			
/*			eventMap.mapListener(eventDispatcher, StoneStockCheckEvent.STOCK_STOLEN, stockStolenHandler, StoneStockCheckEvent);
			
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.STONE_OFFERED, stoneOfferedHandler, StoneSupplyEvent);
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.NO_STONE_OFFERED, noStoneOfferedHandler, StoneSupplyEvent);
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.STONE_DILEMMA, stoneDilemmaHandler, StoneSupplyEvent);

			eventMap.mapListener(eventDispatcher, LabourSupplyEvent.WORKERS_OFFERED, workersOfferedHandler, LabourSupplyEvent);
  */
			eventMap.mapListener(eventDispatcher, DailyProgressEvent.PROGRESS_CALCULATED, progressCalculatedHandler, DailyProgressEvent);
    
			eventMap.mapListener(eventDispatcher, DayCycleEvent.STONE_STOCK_CHECKED, stoneStockChecked, DayCycleEvent);
	/*
			eventMap.mapListener(eventDispatcher, DayCycleEvent.STONE_DELIVERY_COMPLETED, stoneDeliveryCompletedHandler, DayCycleEvent);
			eventMap.mapListener(eventDispatcher, DayCycleEvent.LABOUR_HIRE_COMPLETED, labourHireCompletedHandler, DayCycleEvent);
			eventMap.mapListener(eventDispatcher, DayCycleEvent.DAY_ENDED, dayEndedHandler, DayCycleEvent); 
			
			eventMap.mapListener(eventDispatcher, DilemmaEvent.DILEMMA_PRESENTED, dilemmaPresentedHandler, DilemmaEvent);
			
			eventMap.mapListener(eventDispatcher, GameOverEvent.GAME_OVER, gameOverHandler, GameOverEvent);
			eventMap.mapListener(eventDispatcher, GameWonEvent.GAME_WON, gameWonHandler, GameWonEvent);    
	  */  	
		}   
		
		private function mapDayEventType(type:String):void
		{
			eventMap.mapListener(eventDispatcher, type, dayCycleEventHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function prepareLookups():void
		{
			_skyPositionByDayEvent = new Dictionary();
			_skyPositionByDayEvent[DayCycleEvent.NEW_DAY_STARTED] = 0;        
			_skyPositionByDayEvent[DayCycleEvent.WORKING_DAY_STARTED] = 10;
			_skyPositionByDayEvent[DayCycleEvent.STONE_STOCK_CHECKED] = 20;
			_skyPositionByDayEvent[DayCycleEvent.STONE_DELIVERY_COMPLETED] = 30;
			_skyPositionByDayEvent[DayCycleEvent.LABOUR_HIRE_COMPLETED] = 40;
			_skyPositionByDayEvent[DayCycleEvent.RANDOM_EVENTS_COMPLETED] = 70;
			_skyPositionByDayEvent[DayCycleEvent.PROGRESS_CALCULATED] = 90;
			_skyPositionByDayEvent[DayCycleEvent.DAY_ENDED] = 0;
		}
		
		private function dayCycleEventHandler(e:DayCycleEvent):void
		{
			var positionRequired:Number = _skyPositionByDayEvent[e.type];
			view.showDayPercentage(positionRequired);
		} 
		
		private function progressCalculatedHandler(e:DailyProgressEvent):void
		{
			view.night();
		}
		
		private function stoneStockChecked(e:DayCycleEvent):void
		{
		    view.day();
		}
	   
	}
}