package strategy.controller.events {
	
	import flash.events.Event;
	
	public class GameWonEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const GAME_WON:String = "GameWonEvent.gameWon";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function GameWonEvent(type:String, daysRemaining:uint, cashRemaining:Number, bubbles:Boolean=true, cancelable:Boolean=false ){
			_daysRemaining = daysRemaining;
			_cashRemaining = cashRemaining;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	   	
		protected var _daysRemaining:uint;

		public function get daysRemaining():uint
		{
			return _daysRemaining;
		}
		
		protected var _cashRemaining:Number;

		public function get cashRemaining():Number
		{
			return _cashRemaining;
		}
		
	 
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new GameWonEvent(type, _daysRemaining, _cashRemaining, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
