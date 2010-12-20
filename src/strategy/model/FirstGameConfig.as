package strategy.model {
	
	public class FirstGameConfig extends GameConfigVO {
		
		public function FirstGameConfig() { 
			_calendarDays = 30;
			_workingDaysPerWeek = 5;
			_daysPerTurn = 1;
			_targetBuildTotal = 6500;
			_minimumTeamSize = 3;
			_maximumTeamSize = 4;
			_minimumWorkerProductivity = 90;
			_maximumWorkerProductivity = 120;
			_minimumLabourCost = 200;
			_maximumLabourCost = 400;
			
			_startingBudget = 125000; 
			_stoneStockCapacity = 500;
			
			_numberOfNormalDaysAtStart = 3;
			
			_minimumStoneAvailability = 300;
			_maximumStoneAvailability = 450;
			_stoneAvailabilityVariability = 50;
			_minimumStonePrice = 8;
			_maximumStonePrice = 20;
			
			_stoneSurpriseEventProbability = 20; 
			
			_dailyEnvironmentalImpact = -2;
			_dailySafetyImpact = -2;
		} 
	}
}
