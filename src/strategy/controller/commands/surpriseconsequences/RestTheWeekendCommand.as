package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.IGameConfig;
	import strategy.controller.events.DayCycleEvent;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class RestTheWeekendCommand extends Command
	{
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var labourModel:ILabourModel;
		
		[Inject]
		public var config:IGameConfig;

		[Inject]
		public var optionEvent:OptionEvent;
        
		override public function execute():void 
		{
			updateCalendarToSkipWeekend();     
			
			restWorkers();
			
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.DAY_ENDED);
			dispatch(evt);
		}
		
		protected function updateCalendarToSkipWeekend():void
		{
			var restDays:Number = 7 - config.workingDaysPerWeek;
			calendarModel.adjustByValue(-restDays);
		}
		
		protected function restWorkers():void
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			labourModel.adjustTeamEnergy(dilemmaConfig.productivity);
		} 
		
	}
}