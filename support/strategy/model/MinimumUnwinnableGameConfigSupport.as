package strategy.model {
	                                 
	import strategy.model.GameConfigVO;
	
	public class MinimumUnwinnableGameConfigSupport extends GameConfigVO {
		
		/*
		protected var _calendarDays:uint;
		protected var _workingDaysPerWeek:uint;
		protected var _daysPerTurn:uint;
		protected var _targetBuildTotal:Number;
		protected var _minimumTeamSize:Number;
		protected var _maximumTeamSize:Number;
		protected var _minimumWorkerProductivity:Number;
		protected var _maximumWorkerProductivity:Number;
		*/
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		public function MinimumUnwinnableGameConfigSupport() {			
			// pass constants to the super constructor for properties
			_calendarDays = 10;
			_workingDaysPerWeek = 7;
			_daysPerTurn = 1;
			_targetBuildTotal = 1000;
			_minimumTeamSize = 1;
			_maximumTeamSize = 1;
			_minimumWorkerProductivity = 10;
			_maximumWorkerProductivity = 10;
			_minimumLabourCost = 80;
			_maximumLabourCost = 120;
			_startingBudget = 1000;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		
	}
}