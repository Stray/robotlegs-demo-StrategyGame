package org.robotlegs.base {
	
	import org.robotlegs.core.ICompoundCommandConfig;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import org.robotlegs.base.EventAsPayload;
	import org.robotlegs.core.IEventAsPayload;
	
	public class CompoundCommandConfig implements ICompoundCommandConfig {
		
		protected var _requiredEvents:Array;
		protected var _remainingRequiredEvents:Array;
		
		protected var _callbacksInOrder:Array; 
		
		protected var _requiredInOrder:Boolean;
		
		protected var _eventDispatcher:IEventDispatcher;
		
		protected var _executionHandler:Function;
		
		protected var _eventsAsPayloads:Array;
		
		protected var _oneshot:Boolean;
		
   		public function CompoundCommandConfig(eventDispatcher:IEventDispatcher, executionHandler:Function, oneshot:Boolean = false, requiredInOrder:Boolean = false) {
		
			_executionHandler = executionHandler;
			_eventDispatcher = eventDispatcher;
			_requiredInOrder = requiredInOrder;
			_oneshot = oneshot;
		}
		
		//---------------------------------------
		// ICompoundCommandConfig Implementation
		//---------------------------------------

		//import org.robotlegs.core.ICompoundCommandConfig;
		public function get requiredEvents():Array
		{
			return _requiredEvents ||= new Array();
		}

		public function get remainingRequiredEvents():Array
		{
			return _remainingRequiredEvents ||= new Array();
		}
		
		protected function get callbacksInOrder():Array
		{
			return _callbacksInOrder ||= new Array();
		}

		public function get requiredInOrder():Boolean
		{
			return _requiredInOrder;
		}
		
		public function get eventsAsPayloads():Array
		{
			return _eventsAsPayloads ||= new Array();
		}
		
		public function get oneshot():Boolean
		{
			return _oneshot;
		}

		public function addRequiredEvent(eventType:String, eventClass:Class = null, named:String = ""):ICompoundCommandConfig
		{
		    requiredEvents.push(eventType);
			remainingRequiredEvents.push(eventType);
			
			eventClass = eventClass || Event;
			
			//var eventClassMap:Dictionary = eventTypeMap[eventType] ||= new Dictionary(false);
				
			// callbacksByCommandClass:Dictionary = eventClassMap[eventClass] ||= new Dictionary(false);
				
			var callback:Function = function(event:Event):void
			{
				logEventForCommand(event, eventClass, named, callback);
			};  

			callbacksInOrder.push(callback);
			
			_eventDispatcher.addEventListener(eventType, callback, false, 0, true);
			
			return this;
		}

		protected function logEventForCommand(event:Event, originalEventClass:Class, named:String, callback:Function):void
		{
			if (!(event is originalEventClass)) return;
			
			var eventIndex:int = remainingRequiredEvents.indexOf(event.type); 
			
			if(eventIndex == -1) return; 
						
			if((callbacksInOrder[0] == callback)||(!_requiredInOrder))
			{
				var eventAsPayload:IEventAsPayload = new EventAsPayload(event, originalEventClass, named);
				eventsAsPayloads.push(eventAsPayload);
				
				remainingRequiredEvents.splice(eventIndex, 1);
				callbacksInOrder.push(callbacksInOrder.shift());
			}
			
			if(allEventsReceived)
			{
				_executionHandler(this);
				_remainingRequiredEvents = _requiredEvents.slice();
			}
			
			if(_oneshot)
			{
				_eventDispatcher.removeEventListener(event.type, callback, false);
			}
   		}

		
		protected function get allEventsReceived():Boolean
		{
			return (remainingRequiredEvents.length == 0);
		}

	}
}