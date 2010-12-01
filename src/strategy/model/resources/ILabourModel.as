package strategy.model.resources {
		
	import strategy.model.resources.IWorker;
	import strategy.model.base.IMarketVariationModel;
	
	public interface ILabourModel extends IMarketVariationModel {
				
		function get teamSize():uint;
		
		function set teamSize(value:uint):void;
		
		function get team():Vector.<IWorker>;
	}
}