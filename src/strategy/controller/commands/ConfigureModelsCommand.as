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
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	import strategy.controller.surprises.IStoneSurpriseEventCaster;
	import strategy.model.markets.ILabourAvailabilityMarket;
	
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
		
		[Inject]
		public var stoneAvailabilityMarket:IStoneAvailabilityMarket;
		
		[Inject]
		public var stonePriceMarket:IStonePriceMarket;
		
		[Inject]
		public var stoneSurpriseEventCaster:IStoneSurpriseEventCaster;
		
		[Inject]
		public var labourAvailabilityMarket:ILabourAvailabilityMarket;
		
		override public function execute():void 
		{
			buildingProgress.max = gameConfig.targetBuildTotal;
			buildingProgress.currentValue = 0;

			calendar.min = 0;
			calendar.max = gameConfig.calendarDays;  
			calendar.currentValue = gameConfig.calendarDays;

			labourPriceMarket.min = gameConfig.minimumLabourCost;
			labourPriceMarket.max = gameConfig.maximumLabourCost;

			labour.min = gameConfig.minimumWorkerProductivity;
			labour.max = gameConfig.maximumWorkerProductivity;
			labour.teamSize = gameConfig.minimumTeamSize; 
			
			labourAvailabilityMarket.min = 1;
			labourAvailabilityMarket.max = 3;
			
			cash.min = 0;
			cash.currentValue = gameConfig.startingBudget;
			
			stoneStock.min = 0;
			stoneStock.max = gameConfig.stoneStockCapacity;
			stoneStock.currentValue = 0;
			
			trace("ConfigureModelsCommand::execute()",  stoneAvailabilityMarket);                                                                  
			stoneAvailabilityMarket.min = gameConfig.minimumStoneAvailability;
			stoneAvailabilityMarket.max = gameConfig.maximumStoneAvailability;
			
			stonePriceMarket.min = gameConfig.minimumStonePrice;
			stonePriceMarket.max = gameConfig.maximumStonePrice;
			
			stoneSurpriseEventCaster.surprisePercentageProbability = gameConfig.stoneSurpriseEventProbability;
			stoneSurpriseEventCaster.primeSurpriseEvents();
			
		} 
	}
}