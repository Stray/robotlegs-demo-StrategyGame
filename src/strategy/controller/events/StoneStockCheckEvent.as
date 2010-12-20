package strategy.controller.events {
	
	import flash.events.Event;
	
	public class StoneStockCheckEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const STOCK_STOLEN:String = "StoneStockCheckEvent.stockStolen"
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function StoneStockCheckEvent(type:String, quantity:Number, isInsured:Boolean = false, bubbles:Boolean=true, cancelable:Boolean=false ){
			_quantity = quantity;
			_isInsured = isInsured;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _quantity:Number;

		public function get quantity():Number
		{
			return _quantity;
		} 
		
		protected var _isInsured:Boolean;

		public function get isInsured():Boolean
		{
			return _isInsured;
		}
				
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new StoneStockCheckEvent(type, _quantity, _isInsured, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
