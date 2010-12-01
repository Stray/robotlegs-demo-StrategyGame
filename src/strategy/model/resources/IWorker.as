package strategy.model.resources {
		
	import strategy.model.base.IMarketVariationModel;
	
	public interface IWorker extends IMarketVariationModel {
		
		function get energyLevel():Number;
		
		function set energyLevel(value:Number):void; 
		
		function get maxEnergyLevel():Number;
		
		function set maxEnergyLevel(value:Number):void;
	 
		function adjustEnergyLevel(value:Number):void;
		
	}
}