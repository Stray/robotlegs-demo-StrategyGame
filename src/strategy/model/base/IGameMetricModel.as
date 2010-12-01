package strategy.model.base
{
import flash.events.IEventDispatcher;

	public interface IGameMetricModel
	{
	 
		function get max():Number;
		
		function set max(value:Number):void;
		
		function get min():Number;
		
		function set min(value:Number):void;
		
		function get currentValue():Number;
		
		function set currentValue(value:Number):void;
		
		function get history():Vector.<Number>;
		
		function get eventDispatcher():IEventDispatcher;
		
		function set eventDispatcher(value:IEventDispatcher):void;
	                       
	}

}