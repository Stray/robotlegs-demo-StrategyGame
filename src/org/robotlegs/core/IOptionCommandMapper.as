package org.robotlegs.core
{
	import strategy.model.gameplay.IOptionVO;
	import org.robotlegs.core.IOptionCommandMap;

	public interface IOptionCommandMapper
	{

		function set optionCommandMap(value:IOptionCommandMap):void;

		function get optionCommandMap():IOptionCommandMap;
		
		function mapDilemmaOptions(options:Vector.<IOptionVO>):void;
	
	}
 
}