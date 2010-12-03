package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.IGameConfig;
	import strategy.model.resources.ICashModel;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.resources.IStoneSupplyModel;
	
	public class ConfigureModelsCommand extends Command
	{
		[Inject]
		public var buildingProgress:IBuildingProgressModel;
		
		[Inject]
		public var calendar:ICalendarModel;
		
		[Inject]
		public var labour:ILabourModel;
		
		[Inject]
		public var labourPriceMarket:ILabourPriceMarket;
		
		[Inject]
		public var cash:ICashModel; 
		
		[Inject]
		public var gameConfig:IGameConfig; 
		
		[Inject]
		public var stoneStock:IStoneSupplyModel;
		
		override public function execute():void 
		{
			buildingProgress.max = gameConfig.targetBuildTotal;
			buildingProgress.currentValue = 0;

			calendar.min = 0;  
			calendar.currentValue = gameConfig.calendarDays;

			labourPriceMarket.min = gameConfig.minimumLabourCost;
			labourPriceMarket.max = gameConfig.maximumLabourCost;

			labour.min = gameConfig.minimumWorkerProductivity;
			labour.max = gameConfig.maximumWorkerProductivity;
			labour.teamSize = gameConfig.minimumTeamSize; 
			
			cash.min = 0;
			cash.currentValue = gameConfig.startingBudget;
			
			stoneStock.min = 0;
			stoneStock.max = gameConfig.stoneStockCapacity;
			stoneStock.currentValue = 0;
			
		} 
	}
}