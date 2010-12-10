package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DayCycleEvent;
	
	public class SkipHireWorkersCommand extends Command
	{
		
		override public function execute():void 
		{
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.LABOUR_HIRE_COMPLETED);
			dispatch(evt);
		} 
	}
}