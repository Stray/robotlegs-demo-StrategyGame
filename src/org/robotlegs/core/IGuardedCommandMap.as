package org.robotlegs.core {
		
	import org.robotlegs.core.ICommandMap;
	
	public interface IGuardedCommandMap extends ICommandMap { 
		
		/**
		 * Map a Command to an Event type, with Guards
		 * 
		 * <p>The <code>commandClass</code> must implement an execute() method</p>
		 * <p>The <code>guards</code> must be a Class which implements an approve() method</p>
		 * <p>or an <code>Array</code> of Classes which implements an approve() method</p>
		 * 
		 * @param eventType The Event type to listen for
		 * @param commandClass The Class to instantiate - must have an execute() method
		 * @param guards The Classes of the guard or guards to instantiate - must have an approve() method
		 * @param eventClass Optional Event class for a stronger mapping. Defaults to <code>flash.events.Event</code>. Your commandClass can optionally [Inject] a variable of this type to access the event that triggered the command.
		 * @param oneshot Unmap the Class after execution?
		 * 
		 * @throws org.robotlegs.base::ContextError
		*/
		function mapGuardedEvent(eventType:String, commandClass:Class, guards:*, eventClass:Class = null, oneshot:Boolean = false):void;
		
	}
}