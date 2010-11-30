package strategy.model.base {
		
	public interface IMarketVariationModel extends IGameMetricModel {
		
		function get volatility():Number;
		
		function set volatility(value:Number):void;
		
		function get pointAverage():uint;
		
		function set pointAverage(value:uint):void;
		
		function move():void;
		
		function setToMaximum():void;
		
		function setToMinimum():void;
		
		function setToMidpoint():void;
		
	}
}
