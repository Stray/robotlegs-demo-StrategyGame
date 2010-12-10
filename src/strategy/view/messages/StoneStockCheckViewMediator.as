package strategy.view.messages {
	
	import strategy.view.messages.StoneStockCheckView;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.DayCycleEvent;
	
	public class StoneStockCheckViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:StoneStockCheckView;
		
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
		
		public function StoneStockCheckViewMediator() {			
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
		
		protected function submitHandler():void
		{
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.STONE_STOCK_CHECKED);
			dispatch(evt);
		}
		
	}
}