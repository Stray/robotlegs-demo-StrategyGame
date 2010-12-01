package strategy.controller.events {
	
	import flash.events.Event;
	import strategy.model.transactions.StoneTransactionVO;
	
	public class StoneSupplyEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const STONE_OFFERED:String = "StoneSupplyEvent.stoneOffered";
		public static const STONE_DILEMMA:String = "StoneSupplyEvent.stoneDilemma";
		public static const STONE_INCIDENT:String = "StoneSupplyEvent.stoneIncident";
		public static const STONE_PURCHASED:String = "StoneSupplyEvent.stonePurchased";
		public static const NO_STONE_OFFERED:String = "StoneSupplyEvent.noStoneOffered";
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function StoneSupplyEvent(type:String, message:String, transactionVO:StoneTransactionVO, bubbles:Boolean=true, cancelable:Boolean=false ){
			_message = message;
			_transactionVO = transactionVO;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _message:String;

		public function get message():String
		{
			return _message;
		}
		
		protected var _transactionVO:StoneTransactionVO;

		public function get transactionVO():StoneTransactionVO
		{
			return _transactionVO;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new StoneSupplyEvent(type, _message, _transactionVO, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}