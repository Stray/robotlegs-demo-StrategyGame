package strategy.view.decisions {
	
	import strategy.view.decisions.NoStoneView;
	
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.model.transactions.NullStoneTransactionVO;
	import strategy.controller.events.StoneSupplyEvent;
	
	public class NoStoneViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:NoStoneView;
		
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
		
		public function NoStoneViewMediator() {			
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
			addToSignal(view.submitSignal, submitHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function submitHandler():void
		{
			var nullTransactionVO:NullStoneTransactionVO = new NullStoneTransactionVO();
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_PURCHASED, '', nullTransactionVO);
			dispatch(evt);
		}
		
	}
}