package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.IGameConfig;
	import strategy.model.resources.ICashModel;
	
	public class ConfigureModelsCommand extends Command
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
		public var gameConfig:IGameConfig;
		
		override public function execute():void 
		{
			buildingProgress.max = gameConfig.targetBuildTotal;
			buildingProgress.currentValue = 0;

			calendar.min = 0;  
			calendar.currentValue = gameConfig.calendarDays;

			labour.min = gameConfig.minimumWorkerProductivity;
			labour.max = gameConfig.maximumWorkerProductivity;
			labour.teamSize = gameConfig.minimumTeamSize; 
		    
		
			
			cash.min = 0;
			cash.currentValue = gameConfig.startingBudget;
		} 
	}
}