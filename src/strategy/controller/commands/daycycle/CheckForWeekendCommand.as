package strategy.controller.commands.daycycle 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.IGameConfig;
	import strategy.model.resources.ICalendarModel;
	import strategy.controller.events.DayCycleEvent;
	
	public class CheckForWeekendCommand extends Command
	{
		[Inject]
		public var config:IGameConfig;
		
		[Inject]
		public var calendarModel:ICalendarModel;
		
		override public function execute():void 
		{
			if(isTheWeekend)
			{
				var weekendEvent:DayCycleEvent = new DayCycleEvent(DayCycleEvent.WEEKEND_DAY_STARTED);
				dispatch(weekendEvent);
			}
			else
			{
				var workingDayEvent:DayCycleEvent = new DayCycleEvent(DayCycleEvent.WORKING_DAY_STARTED);
				dispatch(workingDayEvent);
			}
		}
		
		private function get isTheWeekend():Boolean
		{
			var daysPassed:uint = calendarModel.daysPassed;
			var weekDays:uint = 7;
			var workingDays:uint = config.workingDaysPerWeek;
			
			if((daysPassed % weekDays) == workingDays)
			{
				return true;
			}
			
			return false;
		} 
	}
}