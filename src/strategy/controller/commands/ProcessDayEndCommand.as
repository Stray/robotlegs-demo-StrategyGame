package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.ICashModel;
	
	public class ProcessDayEndCommand extends Command
	{
		[Inject]
		public var buildingProgress:IBuildingProgressModel;
		
		[Inject]
		public var calendar:ICalendarModel;
		
		[Inject]
		public var labour:ILabourModel;
		
		[Inject]
		public var cash:ICashModel;
		
		override public function execute():void 
		{
			var blocksBuilt:Number = labour.currentValue;
			buildingProgress.adjustByValue(blocksBuilt);
			
			var costOfLabour:Number = labour.teamCost;
			cash.adjustByValue(-costOfLabour);

			calendar.adjustByValue(-1);
		} 
	}
}