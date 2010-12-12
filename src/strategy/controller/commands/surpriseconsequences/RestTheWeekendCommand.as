package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	
	public class RestTheWeekendCommand extends Command
	{
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var labourModel:ILabourModel;
		
		override public function execute():void 
		{
			// do stuff here
		} 
	}
}