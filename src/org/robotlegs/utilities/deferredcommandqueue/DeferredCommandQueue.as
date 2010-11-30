package org.robotlegs.utilities.deferredcommandqueue {
	
	import org.robotlegs.utilities.deferredcommandqueue.IDeferredCommandQueue;
	import flash.utils.describeType;
	import flash.errors.IllegalOperationError;
	
	public class DeferredCommandQueue implements IDeferredCommandQueue {
		
		private var _commands:Vector.<Class>;
		private var _commandsHistory:Vector.<Class>;
		
		public function DeferredCommandQueue() {
		}
		
		//---------------------------------------
		// IDeferredCommandQueue Implementation
		//---------------------------------------

		/* adds a command class to the queue - throws an error if the class doesn't implement 'execute'
		   if isRepeated is false then the command is only added if it's not already queued or in history as having been executed
		   returns a boolean, true if this is a new command, false if it's not (and was not added) */
		
		public function addCommandToQueue(commandClass:Class, isRepeated:Boolean = false):Boolean
		{
			if(!isACommand(commandClass))
			{
				throw(new IllegalOperationError('The class you passed as a Command does not implement the required execute method.'));
			}
			
			if(!isRepeated)
			{
				if(isInQueue(commandClass) || isInHistory(commandClass))
				{
					return false;
				}
			}
			
			commands.push(commandClass);
			
			return true;
		}
        
		/* gets the next command in the queue
		   returns null if there's nothing left */
		
		public function getNextCommand():Class
		{
			if(commands.length > 0)
			{
				var nextCommand:Class = commands.shift();
				commandsHistory.push(nextCommand);
				return nextCommand;
			}
			return null;
		}
        
		public function get hasNextCommand():Boolean
		{
			return (commands.length > 0);
		}
        

		
       	private function get commands():Vector.<Class>
		{	
	    	return _commands || (_commands = new Vector.<Class>());
		}
		
		private function get commandsHistory():Vector.<Class>
		{	
	    	return _commandsHistory || (_commandsHistory = new Vector.<Class>());
		}
		
	   
	 	private function isACommand(commandClass:Class):Boolean
		{
			if(describeType(commandClass).factory.method.(@name == "execute").length() > 0)
			{
				return true;
			}
			
			return false;
		}
		
		private function isInQueue(commandClass:Class):Boolean
		{
			return (commands.indexOf(commandClass) != -1)
		}
		
		private function isInHistory(commandClass:Class):Boolean
		{
			return (commandsHistory.indexOf(commandClass) != -1)
		} 
	}
}