package org.robotlegs.utilities.signals.mvcs
{
    import flash.display.DisplayObjectContainer;

	import org.robotlegs.utilities.signals.base.SignalCommandMap;
    import org.robotlegs.utilities.signals.core.ISignalCommandMap;
    import org.robotlegs.utilities.signals.core.ISignalContext;

	import org.robotlegs.mvcs.Context;

    public class SignalContext extends Context implements ISignalContext
    {
        protected var _signalCommandMap:ISignalCommandMap;

        public function SignalContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
	    	super(contextView, autoStartup);
		}

		public function get signalCommandMap():ISignalCommandMap
        {
            return _signalCommandMap || (_signalCommandMap = new SignalCommandMap(injector));
        }

        public function set signalCommandMap(value:ISignalCommandMap):void
        {
            _signalCommandMap = value;
        }

        override protected function mapInjections():void
        {
            super.mapInjections();
            injector.mapValue(ISignalCommandMap, signalCommandMap);
        }
    }
}