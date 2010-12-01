package strategy.model
{

	public class GameConfigVO extends Object implements IGameConfig
	{
	    
		protected var _calendarDays:uint;
		protected var _workingDaysPerWeek:uint;
		protected var _daysPerTurn:uint;
		protected var _targetBuildTotal:Number;
		protected var _minimumTeamSize:Number;
		protected var _maximumTeamSize:Number;
		protected var _minimumWorkerProductivity:Number;
		protected var _maximumWorkerProductivity:Number;
		protected var _standardLabourCost:Number;
		protected var _startingBudget:Number;
		
		public function GameConfigVO()
		{
			super();
		}
		//---------------------------------------
		// IGameConfig Implementation
		//---------------------------------------

		//import strategy.model.IGameConfig;
		public function get calendarDays():uint
		{
			return _calendarDays;
		}

		public function get workingDaysPerWeek():uint
		{
			return _workingDaysPerWeek;
		}

		public function get daysPerTurn():uint
		{
			return _daysPerTurn;
		}

		public function get targetBuildTotal():Number
		{
			return _targetBuildTotal;
		}

		public function get minimumTeamSize():uint
		{
			return _minimumTeamSize;
		}

		public function get maximumTeamSize():uint
		{
			return _maximumTeamSize;
		}

		public function get minimumWorkerProductivity():Number
		{
			return _minimumWorkerProductivity;
		}

		public function get maximumWorkerProductivity():Number
		{
			return _maximumWorkerProductivity;
		}
		
		public function get standardLabourCost():Number
		{
			return _standardLabourCost;
		}
		
		public function get startingBudget():Number
		{
			return _startingBudget;
		}

	}

}

