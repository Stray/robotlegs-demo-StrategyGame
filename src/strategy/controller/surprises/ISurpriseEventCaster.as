package strategy.controller.surprises
{
import flash.events.IEventDispatcher;

	public interface ISurpriseEventCaster
	{
		function set surprisePercentageProbability(value:Number):void;
		
		function castSurpriseEvent():void;
		
		function castNormalEvent():void;
		 
		function get eventDispatcher():IEventDispatcher;
		
		function set eventDispatcher(value:IEventDispatcher):void;
		
		function primeSurpriseEvents():void;
	}

}