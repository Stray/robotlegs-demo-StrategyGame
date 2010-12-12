package strategy.model {
	
	public class FirstGameConfig extends GameConfigVO {
		
		public function FirstGameConfig() { 
			_calendarDays = 30;
			_workingDaysPerWeek = 7;
			_daysPerTurn = 1;
			_targetBuildTotal = 10000;
			_minimumTeamSize = 3;
			_maximumTeamSize = 4;
			_minimumWorkerProductivity = 60;
			_maximumWorkerProductivity = 100;
			_minimumLabourCost = 80;
			_maximumLabourCost = 120;
			
			_startingBudget = 100000; 
			_stoneStockCapacity = 500;
			
			_numberOfNormalDaysAtStart = 3;
			
			_minimumStoneAvailability = 300;
			_maximumStoneAvailability = 350;
			_minimumStonePrice = 8;
			_maximumStonePrice = 20;
			
			_stoneSurpriseEventProbability = 20;
		} 
	}
}
