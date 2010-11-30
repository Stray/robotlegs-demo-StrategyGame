package org.robotlegs.utilities.signals.mvcs
{
    import org.robotlegs.utilities.signals.core.ISignalCommandMap;

	import org.robotlegs.mvcs.Command;

    public class SignalCommand extends Command
    {
        [Inject]
        public var signalCommandMap:ISignalCommandMap;
    }
}