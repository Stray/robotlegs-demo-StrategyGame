package strategy.model.resources {
	
	import strategy.model.base.MarketVariationModel;
	import strategy.model.base.IMarketVariationModel;
	
	public class Worker extends MarketVariationModel implements IWorker {
		
		protected var _energyModel:IMarketVariationModel;
		
		protected const DEFAULT_ENERGY_LEVEL:Number = 100;
		
		protected const DEFAULT_MAX_ENERGY_LEVEL:Number = 100;
		protected const MIN_ENERGY_LEVEL:Number = 0;
		
		public function Worker() {
			createEnergyModel();
		}
		
		private function createEnergyModel():void
		{
			_energyModel = new MarketVariationModel();
			_energyModel.max = DEFAULT_MAX_ENERGY_LEVEL;
			_energyModel.min = MIN_ENERGY_LEVEL;
			_energyModel.currentValue = DEFAULT_ENERGY_LEVEL;
			_energyModel.pointAverage = 1; 
		}
		
		override public function move():void
		{
			var newValue:Number = min + (Math.random() * range);
			newValue = Math.max(min, newValue);
			newValue = Math.min(max, newValue);
			newValue = newValue * _energyModel.currentValue / 100;
			currentValue = newValue;
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

	}
}