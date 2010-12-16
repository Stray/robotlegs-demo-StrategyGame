package strategy.model.gameplay.dilemmas {
	
	public class DilemmaConfigBuilder {
		
		protected var _cash:Number = 0;
		protected var _days:Number = 0;
		protected var _safety:Number = 0;
		protected var _environment:Number = 0;
		protected var _stone:Number = 0;
		protected var _stoneCapacity:Number = 0;
		protected var _dailySafetyChange:Number = 0;
		protected var _dailyEnvironmentChange:Number = 0;
		protected var _productivity:Number = 0;
		protected var _progress:Number = 0;
		protected var _target:Number = 0;
		
		public function DilemmaConfigBuilder() {
		}
		
		public function build():DilemmaConfig
		{
			return new DilemmaConfig( _cash,
			                          _days,
		                              _safety,
		                              _environment,
		                              _stone,
		                              _stoneCapacity,
		                              _dailySafetyChange,
		                              _dailyEnvironmentChange,
		                              _productivity,
		                              _progress,
		                              _target);
		}
		
		public function withCash(cash:Number):DilemmaConfigBuilder
		{
			_cash = cash;
			return this;
		}
		
	    public function withDays(days:Number):DilemmaConfigBuilder
		{
			_days = days;
			return this;
		}
		
		public function withSafety(safety:Number):DilemmaConfigBuilder
		{
			_safety = safety;
			return this;
		} 
		
		public function withEnvironment(environment:Number):DilemmaConfigBuilder
		{
			_environment = environment;
			return this;
		}
		
		public function withStone(stone:Number):DilemmaConfigBuilder
		{
			_stone = stone;
			return this;
		} 
		
		public function withStoneCapacity(stoneCapacity:Number):DilemmaConfigBuilder
		{
			_stoneCapacity = stoneCapacity;
			return this;
		}
		
		public function withProductivity(productivity:Number):DilemmaConfigBuilder
		{
			_productivity = productivity;
			return this;
		}
		
		public function withProgress(progress:Number):DilemmaConfigBuilder
		{
			_progress = progress;
			return this;
		}
		
		public function withTarget(target:Number):DilemmaConfigBuilder
		{
			_target = target;
			return this;
		}    
				 
	}
}
