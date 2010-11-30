package org.robotlegs.utilities.signals.core
{
    
	import org.robotlegs.core.IContext;

	public interface ISignalContext extends IContext
    {
        function get signalCommandMap():ISignalCommandMap;
        function set signalCommandMap(value:ISignalCommandMap):void;
    }
}