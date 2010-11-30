package strategy.model.base
{
	import org.robotlegs.mvcs.Actor;

	public class GameMetricBaseModel extends Actor implements IGameMetricModel
	{
	
		protected const DEFAULT_MAX:Number = 100;
		protected const DEFAULT_MIN:Number = 0;
	
		protected var _max:Number;
		protected var _min:Number;
		protected var _currentValue:Number;
		protected var _history:Vector.<Number>;
	
	
		public function GameMetricBaseModel()
		{
			super();
		}
	
		public function get max():Number
		{
			if(isNaN(_max))
			{
				_max = DEFAULT_MAX;
			}
			return _max;
		}

		public function set max(value:Number):void
		{
			_max = value;
		}

		public function get min():Number
		{
			if(isNaN(_min))
			{
				_min = DEFAULT_MIN;
			}
			
			return _min;
		}

		public function set min(value:Number):void
		{
			_min = value;
		}
	
		public function get currentValue():Number
		{
			if(isNaN(_currentValue))
			{
				_currentValue = ((max + min)/2);
			}
			
			return _currentValue;
		}

		public function set currentValue(value:Number):void
		{
			if(value != _currentValue)
			{
				_currentValue = value;
				dispatchUpdateEvent();
				checkBoundaries();
			}
			history.push(_currentValue);
		}

		public function get history():Vector.<Number>
		{
			return _history ||= new Vector.<Number>();
		} 
		
		public function get range():Number
		{
			return max - min;
		}
		
		protected function dispatchUpdateEvent():void
		{
			
		}
		
		protected function checkBoundaries():void
		{
			
		}
	
	}  

}