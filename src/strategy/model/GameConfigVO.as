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
		protected var _startingBudget:Number;
		protected var _minimumLabourCost:Number;
		protected var _maximumLabourCost:Number;
		protected var _stoneStockCapacity:Number;
		protected var _numberOfNormalDaysAtStart:uint;
		
		protected var _minimumStoneAvailability:Number = 30;
		protected var _maximumStoneAvailability:Number = 300;
		protected var _minimumStonePrice:Number = 8;
		protected var _maximumStonePrice:Number = 25; 
		
		protected var _stoneSurpriseEventProbability:Number = 15;
		
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
		
		public function get minimumLabourCost():Number
		{
			return _minimumLabourCost;
		}
		 
		public function get maximumLabourCost():Number
		{
			return _maximumLabourCost;
		}
		
		public function get startingBudget():Number
		{
			return _startingBudget;
		}
		
		public function get stoneStockCapacity():Number
		{
			return _stoneStockCapacity;
		} 
		
		public function get numberOfNormalDaysAtStart():uint
		{
			return _numberOfNormalDaysAtStart;
		}
		
		public function get minimumStoneAvailability():Number
		{
			return _minimumStoneAvailability;
		}
		
		public function get maximumStoneAvailability():Number
		{
			return _maximumStoneAvailability;
		}
		
		public function get minimumStonePrice():Number
		{
			return _minimumStonePrice;
		}
		
		public function get maximumStonePrice():Number
		{
			return _maximumStonePrice;
		}
		
		public function get stoneSurpriseEventProbability():Number
		{
			return _stoneSurpriseEventProbability;
		}		

	}

}

