package strategy.view.messages {
	
	import strategy.view.messages.DaySummaryView;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.DayCycleEvent;
	
	public class DaySummaryViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:DaySummaryView;
		
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
		
		public function DaySummaryViewMediator() {			
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
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.DAY_ENDED);
			dispatch(evt);
		}
	}
}