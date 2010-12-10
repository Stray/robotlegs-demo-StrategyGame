package strategy.view.decisions {
	
	import strategy.view.decisions.LabourOfferView;
	
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.LabourSupplyEvent;
	
	public class LabourOfferViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:LabourOfferView;
		
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
		
		public function LabourOfferViewMediator() {			
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
			var evt:LabourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.NO_WORKERS_HIRED, null);
			dispatch(evt);
		}
	}
}