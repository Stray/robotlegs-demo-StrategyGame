package strategy.model.gameplay.dilemmas
{
	public class DilemmaConfig extends Object
	{
		protected var _cash:Number;
		protected var _days:Number;
		protected var _safety:Number;
		protected var _environment:Number;
		protected var _stone:Number;
		protected var _stoneCapacity:Number;
		protected var _dailySafetyChange:Number;
		protected var _dailyEnvironmentChange:Number;
		protected var _productivity:Number;
		protected var _progress:Number;
		protected var _target:Number;
	
		public function DilemmaConfig(cash:Number,
		                              days:Number,
		                              safety:Number,
		                              environment:Number,
		                              stone:Number,
		                              stoneCapacity:Number,
		                              dailySafetyChange:Number,
		                              dailyEnvironmentChange:Number,
		                              productivity:Number,
		                              progress:Number,
		                              target:Number)
		{
			super();
		}
	
		public function get cash():Number { return _cash; }
	
		public function get days():Number { return _days; }

		public function get safety():Number { return _safety; }

		public function get environment():Number { return _environment; }

		public function get stone():Number { return _stone; }

		public function get stoneCapacity():Number { return _stoneCapacity; }

		public function get dailySafetyChange():Number { return _dailySafetyChange; }

		public function get dailyEnvironmentChange():Number { return _dailyEnvironmentChange; }

		public function get productivity():Number { return _productivity; }

		public function get progress():Number { return _progress; }
	                                                          
		public function get target():Number { return _target; }
	
	}        

}

