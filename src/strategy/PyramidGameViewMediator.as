package strategy {
	
	import strategy.PyramidGameView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.model.transactions.StoneTransactionVO;
	import strategy.controller.events.StoneSupplyEvent;
	
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
			eventMap.mapListener(eventDispatcher, StoneSupplyEvent.STONE_OFFERED, stoneOfferedHandler, StoneSupplyEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function stoneOfferedHandler(e:StoneSupplyEvent):void
		{
			var transactionVO:StoneTransactionVO = e.transactionVO;
			view.showStoneOffer(transactionVO.price, transactionVO.quantity);
		}
		
	}
}