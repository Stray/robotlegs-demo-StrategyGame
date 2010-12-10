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
		public function StoneStockCheckEvent(type:String, quantity:Number, bubbles:Boolean=true, cancelable:Boolean=false ){
			_quantity = quantity;
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
		
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new StoneStockCheckEvent(type, _quantity, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
