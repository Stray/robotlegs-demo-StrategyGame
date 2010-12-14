package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.IGameConfig;
	import strategy.controller.events.DayCycleEvent;
	
	public class RestTheWeekendCommand extends Command
	{
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var labourModel:ILabourModel;
		
		[Inject]
		public var config:IGameConfig;
		
		override public function execute():void 
		{
			var restDays:Number = 7 - config.workingDaysPerWeek;
			calendarModel.adjustByValue(-restDays);
			labourModel.adjustTeamEnergy(10);
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.DAY_ENDED);
			dispatch(evt);
		} 
	}
}