package org.robotlegs.core
{
import flash.events.Event;

public interface IEventAsPayload
{
	function get event():Event;
	
	function get eventClass():Class;
	
	function get named():String;
}

}