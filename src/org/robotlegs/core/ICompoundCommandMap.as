package org.robotlegs.core {
		
	public interface ICompoundCommandMap extends ICommandMap {
				
		function mapToEvents(commandClass:Class, oneshot:Boolean = false, requiredInOrder:Boolean = false):ICompoundCommandConfig;
		 
		function hasCompoundCommand(commandClass:Class):Boolean;
		
		function unmapCompoundCommand(commandClass:Class):ICompoundCommandConfig;
	}
}
