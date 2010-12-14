package org.robotlegs.core {
		
	import org.robotlegs.core.ICommandMap;

	public interface IOptionCommandMap extends ICommandMap {

		function mapOption(optionNumber:uint, commandClass:Class):void;
		
		function hasCommandForOption(optionNumber:uint):Boolean;
		
		function unmapAllOptions():void;
		
		function optionTypeByNumber(optionNumber:uint):String;
	}
}