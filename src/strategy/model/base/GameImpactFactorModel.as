package strategy.model.base
{

	public class GameImpactFactorModel extends GameFactorModel implements IImpactModel
	{
	    protected var _dailyImpact:Number = 0;
	
		public function GameImpactFactorModel()
		{
			super();
		}
		
		//---------------------------------------
		// IImpactModel Implementation
		//---------------------------------------

		//import strategy.model.base.IImpactModel;
		public function set dailyImpact(value:Number):void
		{
			_dailyImpact = value;
		}

		public function get dailyImpact():Number
		{
			return _dailyImpact;
		}

		public function applyImpact():void
		{
			currentValue = currentValue + _dailyImpact;
		}

		override public function set currentValue(value:Number):void
		{
			value = Math.min(value, max);
			value = Math.max(value, min);
			super.currentValue = value;
		}
	
	}
 
}

