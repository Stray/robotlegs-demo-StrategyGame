package strategy.controller.events {
	
	import flash.events.Event;
	import strategy.model.transactions.WorkerProductivityVO;
	
	public class LabourSupplyEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		public static const NO_WORKERS_OFFERED:String = "LabourSupplyEvent.noWorkersOffered";
		
		public static const WORKERS_OFFERED:String = "LabourSupplyEvent.workersOffered";
		
		public static const WORKERS_HIRED:String = "LabourSupplyEvent.workersHired";

		public static const NO_WORKERS_HIRED:String = "LabourSupplyEvent.noWorkersHired";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function LabourSupplyEvent(type:String, workers:Vector.<WorkerProductivityVO>, bubbles:Boolean=true, cancelable:Boolean=false ){
			_workers = workers;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	   
		protected var _workers:Vector.<WorkerProductivityVO>;

		public function get workers():Vector.<WorkerProductivityVO>
		{
			return _workers;
		}
		
	 
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new LabourSupplyEvent(type, _workers, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}