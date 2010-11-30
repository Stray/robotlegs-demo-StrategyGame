/* AS3
	Copyright 2010 Newloop.
*/
package org.robotlegs.utilities.modular.base {
	import flash.events.Event;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	
	/**
	 *	Event subclass description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  16.02.2010
	 */
	public class ModuleContextEvent extends Event {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		public static const MODULE_STARTUP_COMPLETE : String = "moduleStartupComplete";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@constructor
		 */
		public function ModuleContextEvent( type:String, moduleContextView:ModuleContextView, bubbles:Boolean=true, cancelable:Boolean=false ){
			_moduleContextView = moduleContextView;
			super(type, bubbles, cancelable);		
		}
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get moduleContextView():ModuleContextView{
			return _moduleContextView;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function clone() : Event {
			return new ModuleContextEvent(type, _moduleContextView, bubbles, cancelable);
		}
		
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _moduleContextView:ModuleContextView;
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
	}
	
}
