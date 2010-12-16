package org.robotlegs.base {
	
	import org.robotlegs.base.CommandMap;
	import flash.events.IEventDispatcher;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.base.ContextError;
	import flash.utils.describeType;
	import flash.utils.Dictionary;
	import flash.events.Event;
	import org.robotlegs.core.IGuardedCommandMap;
	
	public class GuardedCommandMap extends CommandMap implements IGuardedCommandMap {
		
		protected var verifiedGuardClasses:Dictionary; 
		
		public const E_GUARD_NOIMPL:String = 'Guard Class does not implement an approve() method';
		
		public function GuardedCommandMap(eventDispatcher:IEventDispatcher, injector:IInjector, reflector:IReflector) {
			super(eventDispatcher, injector, reflector);
			this.verifiedGuardClasses = new Dictionary(false);
		}
		
		//---------------------------------------
		// IGuardedCommandMap Implementation
		//---------------------------------------

		//import org.robotlegs.core.IGuardedCommandMap;
		public function mapGuardedEvent(eventType:String, commandClass:Class, guards:*, eventClass:Class = null, oneshot:Boolean = false):void
		{
			if (!verifiedCommandClasses[commandClass])
			{
				verifiedCommandClasses[commandClass] = describeType(commandClass).factory.method.(@name == "execute").length() == 1;
				if (!verifiedCommandClasses[commandClass])
				{
					throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + ' - ' + commandClass);
				}
			}
            
			if(!(guards is Array))
			{
				guards = [guards]
			}

			verifyGuardClasses(guards);
			
			eventClass = eventClass || Event;
			
			var eventClassMap:Dictionary = eventTypeMap[eventType]
				|| (eventTypeMap[eventType] = new Dictionary(false));
				
			var callbacksByCommandClass:Dictionary = eventClassMap[eventClass]
				|| (eventClassMap[eventClass] = new Dictionary(false));
				
			if (callbacksByCommandClass[commandClass] != null)
			{
				throw new ContextError(ContextError.E_COMMANDMAP_OVR + ' - eventType (' + eventType + ') and Command (' + commandClass + ')');
			}
			
			var callback:Function = function(event:Event):void
			{
				routeEventToGuardedCommand(event, commandClass, oneshot, eventClass, guards);
			};
			eventDispatcher.addEventListener(eventType, callback, false, 0, true);
			callbacksByCommandClass[commandClass] = callback;
		} 
		
		protected function routeEventToGuardedCommand(event:Event, commandClass:Class, oneshot:Boolean, originalEventClass:Class, guardClasses:Array):void
		{
			var eventClass:Class = Object(event).constructor;
			if (!(event is originalEventClass)) return;
			
			injector.mapValue(eventClass, event);
			
			var guardClass:Class;
			var iLength:uint = guardClasses.length;
			for (var i:int = 0; i < iLength; i++)
			{
				guardClass = guardClasses[i];
				var nextGuard:Object = injector.instantiate(guardClass);
				if(nextGuard.approve() == false)
				{
					injector.unmap(eventClass);
					return;
				}
			}
			
			var command:Object = injector.instantiate(commandClass);
			injector.unmap(eventClass);
			command.execute();
			if (oneshot)
			{
				unmapEvent(event.type, commandClass, originalEventClass);
			}
		}
        
		protected function verifyGuardClasses(guardClasses:Array):void
		{
			var iLength:uint = guardClasses.length; 
			var guardClass:Class;
			for (var i:int = 0; i < iLength; i++)
			{   
				guardClass = guardClasses[i];
				if (!verifiedGuardClasses[guardClass])
				{
					verifiedGuardClasses[guardClass] = describeType(guardClass).factory.method.(@name == "approve").length();
					if (!verifiedGuardClasses[guardClass])
						throw new ContextError(E_GUARD_NOIMPL + ' - ' + guardClass);
				}
			}    
			
		}
		 
	}
}