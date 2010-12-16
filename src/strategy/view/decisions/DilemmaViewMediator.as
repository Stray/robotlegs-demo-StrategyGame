package strategy.view.decisions {
	
	import strategy.view.decisions.DilemmaView;
	
	import org.robotlegs.mvcs.SignalMediator;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class DilemmaViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:DilemmaView;
		
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
		
		public function DilemmaViewMediator() {			
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
			view.optionSubmittedSignal.add(optionSubmittedHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		 
		private function optionSubmittedHandler(optionID:uint, payload:DilemmaConfig):void
		{
			var optionLookup:String = "OPTION_" + optionID.toString();
			var evt:OptionEvent = new OptionEvent(OptionEvent[optionLookup], payload);
			dispatch(evt);
			view.dispose();
		}
	}
}