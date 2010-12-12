package strategy.view.messages {
	
	import strategy.view.messages.GameWonView;
	                                               
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.GameEvent;
	
	public class GameWonViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:GameWonView;
		
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
		
		public function GameWonViewMediator() {			
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
			var evt:GameEvent = new GameEvent(GameEvent.GAME_RESTARTED);
			dispatch(evt);
		}
		
	}
}