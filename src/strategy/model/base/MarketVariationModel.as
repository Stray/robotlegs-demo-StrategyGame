package strategy.model.base {
		
	public class MarketVariationModel extends GameMetricBaseModel implements IMarketVariationModel {
		
		protected var _volatility:Number;
		protected var _pointAverage:Number;
				
		protected const DEFAULT_VOLATILITY:Number = 10;
		protected const DEFAULT_POINT_AVERAGE:Number = 4;
		
		public function MarketVariationModel() {
		}
		//---------------------------------------
		// IMarketVariationModel Implementation
		//---------------------------------------

		//import strategy.model.base.IMarketVariationModel;

		public function get volatility():Number
		{
			if(isNaN(_volatility))
			{
				_volatility = DEFAULT_VOLATILITY;
			}                 
			
			return _volatility;
		}

		public function set volatility(value:Number):void
		{
			_volatility = value;
		}

		public function get pointAverage():uint
		{
			if(isNaN(_pointAverage))
			{
				_pointAverage = DEFAULT_POINT_AVERAGE;
			}
			
			return _pointAverage;
		}

		public function set pointAverage(value:uint):void
		{
			_pointAverage = value;
		}

		public function setToMaximum():void
		{
			_currentValue = max;
		}

		public function setToMinimum():void
		{
			_currentValue = min;
		}

		public function setToMidpoint():void
		{
			_currentValue = (max + min) / 2;
		}

		public function move():void
		{
			var direction:int = (Math.random() > currentCentile) ? 1 : -1 ;
		    var fluctuation:Number = Math.random() * volatility;
		    var newValue:Number = currentValue + (direction * fluctuation);
			newValue = Math.max(min, newValue);
			newValue = Math.min(max, newValue);
			
			currentValue = Math.round(newValue);
		}
		
		protected function get movingAverage():Number
		{
			var dataPoints:uint = Math.min(pointAverage, history.length);
			
			var runningTotal:Number = 0;
			
			var iLength:uint = history.length-1;
			for (var i:int = iLength; i >= 0; i--)
			{
				runningTotal += history[i];
			}
			
			var average:Number = runningTotal/dataPoints;
			return average;
		}
		
		protected function get currentCentile():Number
		{
		    return (currentValue - min)/range;
		}
		
	}
}
