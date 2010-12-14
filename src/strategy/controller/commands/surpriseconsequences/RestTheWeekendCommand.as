package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.IGameConfig;
	
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
		} 
	}
}