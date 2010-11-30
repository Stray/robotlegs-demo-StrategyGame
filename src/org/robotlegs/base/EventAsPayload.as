package org.robotlegs.base
{
import flash.events.Event;
import org.robotlegs.core.IEventAsPayload;

public class EventAsPayload extends Object implements IEventAsPayload
{
	
	public function EventAsPayload(event:Event, eventClass:Class, named:String = '')
	{
		_event = event;
		_eventClass = eventClass ||= Event;
		_named = named;
	}
	
	private var _event:Event;

	public function get event():Event
	{
		return _event;
	}
	
	private var _eventClass:Class;

	public function get eventClass():Class
	{
		return _eventClass;
	}
	
	private var _named:String;

	public function get named():String
	{
		return _named;
	}
	
	public function toString():String
	{
		return '[EventAsPayload] - event: ' + _event + " | eventClass: " + _eventClass + " | named: " + _named; 
	}
	
}

}