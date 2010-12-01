package strategy.model.resources {
		
	import strategy.model.resources.IWorker;
	import strategy.model.base.IMarketVariationModel;
	import strategy.model.markets.ILabourPriceMarket;
	
	public interface ILabourModel extends IMarketVariationModel {
				
		function get teamSize():uint;
		
		function set teamSize(value:uint):void;
		
		function get team():Vector.<IWorker>; 
		
		function get teamCost():Number;
		
		function set labourPriceMarket(value:ILabourPriceMarket):void;
	}
}