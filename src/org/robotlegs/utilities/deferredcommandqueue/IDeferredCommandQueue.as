package org.robotlegs.utilities.deferredcommandqueue {
		
	public interface IDeferredCommandQueue {
		
		function addCommandToQueue(commandClass:Class, isRepeated:Boolean = false):Boolean;
		
		function getNextCommand():Class;
		
		function get hasNextCommand():Boolean;
		
	}
}
