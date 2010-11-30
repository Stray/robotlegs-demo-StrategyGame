package org.robotlegs.core {
		
	import flash.events.Event;
	
	public interface ICompoundCommandConfig {
		
		function addRequiredEvent(eventType:String, eventClass:Class = null, named:String = ""):ICompoundCommandConfig;
		
		function get requiredEvents():Array;
		
		function get remainingRequiredEvents():Array;
		
		function get requiredInOrder():Boolean;
		
		function get eventsAsPayloads():Array;
		
		function get oneshot():Boolean;
	}
}