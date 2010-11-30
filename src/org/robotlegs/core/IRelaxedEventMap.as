package org.robotlegs.core
{
import flash.events.IEventDispatcher;

public interface IRelaxedEventMap
{
	function mapRelaxedListener(type:String, listener:Function, eventClass:Class = null, ownerObject:* = null, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = true):void;
    
	function unmapRelaxedListener(type:String, listener:Function, eventClass:Class = null, ownerObject:* = null, useCapture:Boolean = false):void;

	function rememberEvent(type:String, eventClass:Class = null):void;
	
	function unmapListenersFor(ownerObject:*):void;
}

}