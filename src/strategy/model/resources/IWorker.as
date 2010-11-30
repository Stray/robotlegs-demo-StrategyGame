package strategy.model.resources {
		
	public interface IWorker extends IMarketVariationModel {
		
		function get energyLevel():Number;
		
		function set energyLevel(value:Number):void; 
		
		function get maxEnergyLevel():Number;
		
		function set maxEnergyLevel(value:Number):void;
	 
		function adjustEnergyLevel(value:Number):void;
		
	}
}
