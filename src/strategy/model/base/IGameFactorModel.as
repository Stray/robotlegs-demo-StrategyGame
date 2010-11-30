package strategy.model.base {
		
	public interface IGameFactorModel extends IGameMetricModel {
	    
		function get currentPercentage():Number;
		
		function set currentPercentage(value:Number):void;
		                                                  
		function adjustByValue(value:Number):void;
		
		function adjustByPercentage(value:Number):void;
		
	}
}
