package strategy.controller.events {
	
	import flash.events.Event;
	
	public class ResourceStatusEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const BUILDING_PROGRESS_UPDATED:String = "ResourceStatusEvent.buildingProgressUpdated"
		public static const CASH_UPDATED:String = "ResourceStatusEvent.cashUpdated"
		public static const HEALTH_AND_SAFETY_UPDATED:String = "ResourceStatusEvent.healthAndSafetyUpdated"
		public static const ENVIRONMENTAL_IMPACT_UPDATED:String = "ResourceStatusEvent.environmentalImpactUpdated"
		public static const CALENDAR_UPDATED:String = "ResourceStatusEvent.calendarUpdated"
		public static const STONE_SUPPLY_UPDATED:String = "ResourceStatusEvent.stoneSupplyUpdated"
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function ResourceStatusEvent(type:String, value:Number, percentage:Number, bubbles:Boolean=true, cancelable:Boolean=false ){
			_value = value;
			_percentage = percentage;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _value:Number;

		public function get value():Number
		{
			return _value;
		}
		
		protected var _percentage:Number;

		public function get percentage():Number
		{
			return _percentage;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new ResourceStatusEvent(type, _value, _percentage, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
