package org.robotlegs.base 
{
	
	import org.robotlegs.base.CommandMap;
	import flash.events.IEventDispatcher;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.core.IReflector;
	import org.robotlegs.core.IOptionCommandMap;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import org.robotlegs.base.ContextError;
	import flash.utils.describeType;
	
	public class OptionCommandMap extends CommandMap implements IOptionCommandMap
	{
		
		public function OptionCommandMap(eventDispatcher:IEventDispatcher, injector:IInjector, reflector:IReflector) 
		{
			super(eventDispatcher, injector, reflector);
		}
		
		//---------------------------------------
		// IOptionCommandMap Implementation
		//---------------------------------------

		//import org.robotlegs.core.IOptionCommandMap;
		public function mapOption(optionNumber:uint, commandClass:Class):void
		{
			mapOptionEvent(optionTypeByNumber(optionNumber), commandClass, OptionEvent, true);
		}

		public function hasCommandForOption(optionNumber:uint):Boolean
		{
			var optionType:String = optionTypeByNumber(optionNumber);
			return !noMoreCommandsForEvent(optionType, OptionEvent);
		}
		
		public function optionTypeByNumber(optionNumber:uint):String
		{
			var optionLookup:String = "OPTION_" + optionNumber.toString(); 
			return OptionEvent[optionLookup];
		}

		// this functionality basically duplicates the CommandMap.unmapEvents method
		// in order to provide compatibility for version 1.0 robotlegs
		public function unmapAllOptions():void
		{
			for (var eventType:String in eventTypeMap)
			{
				var eventClassMap:Dictionary = eventTypeMap[eventType];
				for each (var callbacksByCommandClass:Dictionary in eventClassMap)
				{
					for each ( var callback:Function in callbacksByCommandClass)
					{
						eventDispatcher.removeEventListener(eventType, callback, false);
					}
				}
			}
			eventTypeMap = new Dictionary(false);
		}

		protected function routeOptionEventToCommand(event:Event, commandClass:Class, oneshot:Boolean, originalEventClass:Class):void
		{
			routeEventToCommand(event, commandClass, oneshot, originalEventClass);
			
			if (noMoreCommandsForEvent(event.type, originalEventClass)) 
			{
				unmapAllOptions();
				eventDispatcher.dispatchEvent(new OptionEvent(OptionEvent.OPTIONS_COMPLETED, null));
			}
			return void;
		}
		
		
		// this is essentially the same as mapEvent in the CommandMap but routeEventToCommand is replaced with
		// routeOptionToCommand. reason is that v1.0 and v1.4 of the CommandMap have differing signatures - one
		// returns a Boolean, the other returns void. So it's not possible to override them and maintain cross
		// version compatitbility. But it also means I can throw an error on mapEvent. Which is nice.
		protected function mapOptionEvent(eventType:String, commandClass:Class, eventClass:Class = null, oneshot:Boolean = false):void
		{
			verifyOptionCommandClass(commandClass);
			eventClass = eventClass || Event;
			
			var eventClassMap:Dictionary = eventTypeMap[eventType] ||= new Dictionary(false);
				
			var callbacksByCommandClass:Dictionary = eventClassMap[eventClass] ||= new Dictionary(false);
				
			if (callbacksByCommandClass[commandClass] != null)
			{
				throw new ContextError(ContextError.E_COMMANDMAP_OVR + ' - eventType (' + eventType + ') and Command (' + commandClass + ')');
			}
			var callback:Function = function(event:Event):void
			{
				routeOptionEventToCommand(event, commandClass, oneshot, eventClass);
			};
			eventDispatcher.addEventListener(eventType, callback, false, 0, true);
			callbacksByCommandClass[commandClass] = callback;
		}
		
		protected function noMoreCommandsForEvent(eventType:String, eventClass:Class):Boolean
		{
			var eventClassMap:Dictionary = eventTypeMap[eventType];
			if (eventClassMap == null) return true;
			var callbacksByCommandClass:Dictionary = eventClassMap[eventClass || Event];
			if (callbacksByCommandClass == null) return true;
			if (dictionaryIsEmpty(callbacksByCommandClass)) return true;
			return false;
		}
		
		protected function dictionaryIsEmpty(dict:Dictionary):Boolean 
		{
		   var len:uint = 0;
		   for (var key:* in dict) len++;
		   return (len == 0);
		}
		
		// more duplication to provide v1/1.4 compatibility
		protected function verifyOptionCommandClass(commandClass:Class):void
		{
			if (!verifiedCommandClasses[commandClass])
			{
				verifiedCommandClasses[commandClass] = describeType(commandClass).factory.method.(@name == "execute").length();
				if (!verifiedCommandClasses[commandClass])
					throw new ContextError(ContextError.E_COMMANDMAP_NOIMPL + ' - ' + commandClass);
			}
		}
		 
	}
}