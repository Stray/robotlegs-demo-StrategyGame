package strategy.model.resources {
		
	import strategy.model.resources.IWorker;
	import strategy.model.base.IMarketVariationModel;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.transactions.WorkerProductivityVO;
	
	public interface ILabourModel extends IMarketVariationModel {
				
		function get teamSize():uint;
		
		function set teamSize(value:uint):void;
		
		function get team():Vector.<IWorker>; 
		
		function get teamCost():Number;
		
		function set labourPriceMarket(value:ILabourPriceMarket):void;
		
		function appendWorkers(workers:Vector.<WorkerProductivityVO>):void;
		
		function removeTempWorkers():void;
		
		function adjustTeamEnergy(value:Number):void;
		
		function suspendWorkerForDays(days:uint):void;
		
		function changeTodaysProductivityBy(value:Number):void;
	}
}