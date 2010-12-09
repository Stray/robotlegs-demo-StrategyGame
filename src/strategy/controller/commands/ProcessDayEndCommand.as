package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.transactions.DailyProductivityVO;
	import strategy.controller.events.DailyProgressEvent;
	import strategy.model.resources.IStoneSupplyModel;
	
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
		
		[Inject]
		public var stoneSupply:IStoneSupplyModel;
		
		override public function execute():void 
		{
			trace("ProcessDayEndCommand::execute()");
			
			var blocksBuilt:Number = labour.currentValue;
			buildingProgress.adjustByValue(blocksBuilt); 
			stoneSupply.adjustByValue(-blocksBuilt);
			
			var costOfLabour:Number = labour.teamCost;
			cash.adjustByValue(-costOfLabour);

			calendar.adjustByValue(-1);
			
			var productivityVO:DailyProductivityVO = new DailyProductivityVO(blocksBuilt, costOfLabour);
			var evt:DailyProgressEvent = new DailyProgressEvent(DailyProgressEvent.PROGRESS_CALCULATED, productivityVO);
			dispatch(evt);
		} 
	}
}