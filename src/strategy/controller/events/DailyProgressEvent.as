package strategy.controller.events {
	
	import flash.events.Event;
	import strategy.model.transactions.DailyProductivityVO;
	
	public class DailyProgressEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const PROGRESS_CALCULATED:String = "DailyProgressEvent.progressCalculated"
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function DailyProgressEvent(type:String, productivityVO:DailyProductivityVO, bubbles:Boolean=true, cancelable:Boolean=false ){
			_productivityVO = productivityVO;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _productivityVO:DailyProductivityVO;

		public function get productivityVO():DailyProductivityVO
		{
			return _productivityVO;
		}
		
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new DailyProgressEvent(type, _productivityVO, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}