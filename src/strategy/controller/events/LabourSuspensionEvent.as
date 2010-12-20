package strategy.controller.events {
	
	import flash.events.Event;
	
	public class LabourSuspensionEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const WORKER_SUSPENSIONS_UPDATED:String = "LabourSuspensionEvent.workerSuspensionsUpdated";
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function LabourSuspensionEvent(type:String, workerStatus:Vector.<Boolean>, bubbles:Boolean=true, cancelable:Boolean=false ){
		    _workerStatus = workerStatus;
		 	super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _workerStatus:Vector.<Boolean>;

		public function get workerStatus():Vector.<Boolean>
		{
			return _workerStatus;
		}
		
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new LabourSuspensionEvent(type, _workerStatus, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}
