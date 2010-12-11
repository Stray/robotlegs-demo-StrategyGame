package strategy.view.messages {
	
	import strategy.view.messages.GameOverView;
	                                                
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.GameEvent;
	
	public class GameOverViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:GameOverView;
		
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
		
		public function GameOverViewMediator() {			
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