package strategy.model.resources {
	
	import strategy.model.base.MarketVariationModel;
	import strategy.model.base.IMarketVariationModel;
	
	public class Worker extends MarketVariationModel implements IWorker {
		
		protected var _energyModel:IMarketVariationModel;
		protected var _pay:Number = 0;
		
		protected const DEFAULT_ENERGY_LEVEL:Number = 100;
		
		protected const DEFAULT_MAX_ENERGY_LEVEL:Number = 100;
		protected const MIN_ENERGY_LEVEL:Number = 0; 
		
		protected var _suspensionCount:uint;
		
		public function Worker() {
			createEnergyModel();
			_suspensionCount = 0;
		}
		
		public function get isSuspended():Boolean
		{
			return (_suspensionCount > 0);
		}
		
		protected function createEnergyModel():void
		{
			_energyModel = new MarketVariationModel();
			_energyModel.max = DEFAULT_MAX_ENERGY_LEVEL;
			_energyModel.min = MIN_ENERGY_LEVEL;
			_energyModel.currentValue = DEFAULT_ENERGY_LEVEL;
			_energyModel.pointAverage = 1; 
		}
		
		override public function move():void
		{
			if(_suspensionCount > 0)
			{
				_suspensionCount--;
			}                      
			
			var newValue:Number = min + (Math.random() * range);
			newValue = Math.max(min, newValue);
			newValue = Math.min(max, newValue);
			newValue = newValue * _energyModel.currentValue / 100;
			currentValue = Math.round(newValue);
		}
		
		override public function get currentValue():Number
		{
			if(_suspensionCount > 0)
			{
				trace("_suspensionCount: " + _suspensionCount);
				return 0;
			}
			
			return super.currentValue;
		}
		
		//---------------------------------------
		// IWorker Implementation
		//---------------------------------------

		//import strategy.model.resources.IWorker;
		public function get energyLevel():Number
		{
			return _energyModel.currentValue;
		}

		public function set energyLevel(value:Number):void
		{
		   _energyModel.currentValue = value;
		}
		
		public function get maxEnergyLevel():Number
		{
			return _energyModel.max;
		}   
		
		public function set maxEnergyLevel(value:Number):void
		{
			_energyModel.max = value;
		}

		public function adjustEnergyLevel(value:Number):void
		{
			var newEnergyValue:Number = _energyModel.currentValue + value; 
			newEnergyValue = Math.min(_energyModel.max, newEnergyValue);
			newEnergyValue = Math.max(_energyModel.min, newEnergyValue);
			_energyModel.currentValue = newEnergyValue;
		}
        
		public function get pay():Number
		{
			return _pay;
		}
		
		public function set pay(value:Number):void
		{
			_pay = value;
		} 
		
		public function suspendForDays(days:int):void
		{
			_suspensionCount+=Math.abs(days);
		}
	}
}