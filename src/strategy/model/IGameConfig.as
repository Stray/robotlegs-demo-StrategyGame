package strategy.model
{

	public interface IGameConfig
	{
	
		function get calendarDays():uint;
		
		function get workingDaysPerWeek():uint;
		
		function get daysPerTurn():uint;
		
		function get targetBuildTotal():Number;
		
		function get minimumTeamSize():uint;
		
		function get maximumTeamSize():uint;
		
		function get minimumWorkerProductivity():Number;
		
		function get maximumWorkerProductivity():Number;
	    
		function get minimumLabourCost():Number;

		function get maximumLabourCost():Number;
		
		function get startingBudget():Number;
		
		function get stoneStockCapacity():Number;
	}

}

