package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	
	public class ProcessDayEndCommand extends Command
	{
		[Inject]
		public var buildingProgress:IBuildingProgressModel;
		
		[Inject]
		public var calendar:ICalendarModel;
		
		[Inject]
		public var labour:ILabourModel;
		
		override public function execute():void 
		{
			var blocksBuilt:Number = labour.currentValue;
			buildingProgress.adjustByValue(blocksBuilt);
			calendar.adjustByValue(-1);
		} 
	}
}