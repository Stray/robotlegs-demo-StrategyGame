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
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
	
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
		
		[Inject]
		public var safety:IHealthAndSafetyModel;
		
		[Inject]
		public var environmentalImpact:IEnvironmentalImpactModel;  
		
		[Inject]
		public var dilemmaSurpriseEventCaster:IDilemmaSurpriseEventCaster;
		
		
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
			
			stoneAvailabilityMarket.min = gameConfig.minimumStoneAvailability;
			stoneAvailabilityMarket.max = gameConfig.maximumStoneAvailability;
			stoneAvailabilityMarket.volatility = gameConfig.stoneAvailabilityVariability;
			
			stonePriceMarket.min = gameConfig.minimumStonePrice;
			stonePriceMarket.max = gameConfig.maximumStonePrice;
			
			stoneSurpriseEventCaster.surprisePercentageProbability = gameConfig.stoneSurpriseEventProbability;
			stoneSurpriseEventCaster.primeSurpriseEvents();  
			
			dilemmaSurpriseEventCaster.surprisePercentageProbability = gameConfig.dilemmaSurpriseEventProbability;
			dilemmaSurpriseEventCaster.primeSurpriseEvents();

			safety.currentValue = 100;
			environmentalImpact.currentValue = 100;
			
			safety.dailyImpact = gameConfig.dailySafetyImpact;
			environmentalImpact.dailyImpact = gameConfig.dailyEnvironmentalImpact;
		} 
	}
}