package org.robotlegs.utilities.deferredcommandqueue
{

	import flash.events.Event;

public class DeferredCommandQueueEvent extends Event
{
	
	public static const QUEUE_COMPLETED:String = "DeferredCommandQueueEvent.queueCompleted";
	
	public function DeferredCommandQueueEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
	{
		super(type, bubbles, cancelable);
	}
	
	override public function clone():Event
	{
		return new DeferredCommandQueueEvent(type, bubbles, cancelable);
	}
	
}

}

