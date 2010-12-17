package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DayCycleEvent;
	
	public class ContinueGameCommand extends Command
	{
		
		override public function execute():void 
		{
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.RANDOM_EVENTS_COMPLETED);
			dispatch(evt);
		} 
	}
}