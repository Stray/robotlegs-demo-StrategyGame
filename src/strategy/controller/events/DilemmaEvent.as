package strategy.controller.events {
	
	import flash.events.Event;
	import strategy.model.gameplay.IDilemmaVO;
	
	public class DilemmaEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const DILEMMA_PRESENTED:String = "DilemmaEvent.dilemmaPresented";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------

		/**
		 *	@constructor
		 */
		public function DilemmaEvent(type:String, dilemmaVO:IDilemmaVO, bubbles:Boolean=true, cancelable:Boolean=false ){
			_dilemmaVO = dilemmaVO;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		protected var _dilemmaVO:IDilemmaVO;

		public function get dilemmaVO():IDilemmaVO
		{
			return _dilemmaVO;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new DilemmaEvent(type, _dilemmaVO, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
	}
}