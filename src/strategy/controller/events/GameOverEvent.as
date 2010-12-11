package strategy.controller.events {
	
	import flash.events.Event;
	
	public class GameOverEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const GAME_OVER:String = "GameOverEvent.gameOver";
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function GameOverEvent(type:String, reason:String, bubbles:Boolean=true, cancelable:Boolean=false ){
			_reason = reason;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _reason:String;

		public function get reason():String
		{
			return _reason;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new GameOverEvent(type, _reason, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
