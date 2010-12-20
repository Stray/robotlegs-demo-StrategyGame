package org.robotlegs.base {
	
	import flash.events.Event;
	
	public class OptionEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const OPTION_1:String = "OptionEvent.option1";
		public static const OPTION_2:String = "OptionEvent.option2";
		public static const OPTION_3:String = "OptionEvent.option3";
		public static const OPTION_4:String = "OptionEvent.option4";
		public static const OPTION_5:String = "OptionEvent.option5";
		public static const OPTION_6:String = "OptionEvent.option6";
		public static const OPTION_7:String = "OptionEvent.option7";
		public static const OPTION_8:String = "OptionEvent.option8";
		public static const OPTION_9:String = "OptionEvent.option9";
		public static const OPTION_10:String = "OptionEvent.option10";
		public static const OPTION_11:String = "OptionEvent.option11";
		public static const OPTION_12:String = "OptionEvent.option12";
		public static const OPTION_13:String = "OptionEvent.option13";
		public static const OPTION_14:String = "OptionEvent.option14";
		public static const OPTION_15:String = "OptionEvent.option15";
		public static const OPTION_16:String = "OptionEvent.option16";
		public static const OPTION_17:String = "OptionEvent.option17";
		public static const OPTION_18:String = "OptionEvent.option18";
		public static const OPTION_19:String = "OptionEvent.option19";
		public static const OPTION_20:String = "OptionEvent.option20";
		
		public static const OPTIONS_COMPLETED:String = "OptionEvent.optionsCompleted";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function OptionEvent(type:String, payload:Object=null, bubbles:Boolean=true, cancelable:Boolean=false ){
			_payload = payload;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _payload:Object;

		public function get payload():Object
		{
			return _payload;
		}
		
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new OptionEvent(type, _payload, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
