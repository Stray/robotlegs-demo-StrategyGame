package strategy.model.transactions {
	
	import flash.events.Event;
	
	public class StoneTransactionVO {
		
		/**
		 *	@constructor
		 */
		public function StoneTransactionVO(quantity:Number, price:Number){
			_quantity = quantity;
			_price = price;
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _quantity:Number;

		public function get quantity():Number
		{
			return _quantity;
		}                             
		
		protected var _price:Number;

		public function get price():Number
		{
			return _price;
		}
		
	}
}
