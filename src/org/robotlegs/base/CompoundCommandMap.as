package org.robotlegs.base {

	import org.robotlegs.core.ICompoundCommandMap;  
	import flash.events.IEventDispatcher;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.core.ICompoundCommandConfig;
	import org.robotlegs.base.CompoundCommandConfig;
	import flash.utils.Dictionary; 
	import flash.utils.describeType;
	import org.robotlegs.base.ContextError;
	import org.robotlegs.core.IEventAsPayload;
	
	public class CompoundCommandMap extends CommandMap implements ICompoundCommandMap {
		
		protected var commandsByConfig:Dictionary;
		protected var configsByCommand:Dictionary;
		
		public function CompoundCommandMap(eventDispatcher:IEventDispatcher, injector:IInjector, reflector:IReflector) {
		
			super(eventDispatcher, injector, reflector);
		}
		
		//---------------------------------------
		// ICompoundCommandMap Implementation
		//---------------------------------------

		//import org.robotlegs.core.ICompoundCommandMap;
		public function mapToEvents(commandClass:Class, oneshot:Boolean = false, requiredInOrder:Boolean = false):ICompoundCommandConfig
		{
			if (!(describeType(commandClass).factory.method.(@name == "execute").length() == 1))
			{
				throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + ' - ' + commandClass);
			}
			
			var commandConfig:ICompoundCommandConfig = new CompoundCommandConfig(eventDispatcher, executeCompoundCommandConfig, oneshot, requiredInOrder);
			commandsByConfig ||= new Dictionary();
			
			commandsByConfig[commandConfig] = commandClass;
			
			configsByCommand ||= new Dictionary();
			configsByCommand[commandClass] = commandConfig;
			 
   			return commandConfig;
			
		}
		
		public function hasCompoundCommand(commandClass:Class):Boolean
		{
			return (configsByCommand[commandClass] != null);
		}
		
		public function unmapCompoundCommand(commandClass:Class):ICompoundCommandConfig
		{
			var config:ICompoundCommandConfig = configsByCommand[commandClass];
			delete commandsByConfig[config];
			delete configsByCommand[commandClass];
			
			return config;
		}
        
		protected function executeCompoundCommandConfig(commandConfig:ICompoundCommandConfig):void
		{
			var commandClass:Class = commandsByConfig[commandConfig];
			
			var payloads:Array = commandConfig.eventsAsPayloads;
			
			// trace("number of payload events: " + payloads.length);
			
			var nextPayloadConfig:IEventAsPayload;
			
			var iLength:uint = payloads.length;
			for (var i:int = 0; i < iLength; i++)
			{
				nextPayloadConfig = payloads[i];
				injector.mapValue(nextPayloadConfig.eventClass, nextPayloadConfig.event, nextPayloadConfig.named);
			}
			
			var command:Object = injector.instantiate(commandClass);
			
			for (i = 0; i < iLength; i++)
			{
				nextPayloadConfig = payloads[i];
				injector.unmap(nextPayloadConfig.eventClass, nextPayloadConfig.named);
			}
			
			if(commandConfig.oneshot)
			{
				unmapCompoundCommand(commandClass);
			}
			
			command.execute();
		}
		 
	}
}