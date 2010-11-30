package org.robotlegs.utilities.signals.base
{
    import flash.utils.Dictionary;

    import org.osflash.signals.*;

    import flash.utils.Dictionary;
    import flash.utils.describeType;

    import org.robotlegs.core.IInjector;
	import org.robotlegs.base.ContextError;
    import org.robotlegs.utilities.signals.core.ISignalCommandMap;

    public class SignalCommandMap implements ISignalCommandMap
    {
        protected var injector:IInjector;
        protected var signalMap:Dictionary;
        protected var signalClassMap:Dictionary;
        protected var verifiedCommandClasses:Dictionary;

        public function SignalCommandMap(injector:IInjector)
        {
            this.injector = injector;
            signalMap = new Dictionary( false );
            signalClassMap = new Dictionary( false );
            verifiedCommandClasses = new Dictionary( false );
        }

        public function mapSignal(signal:ISignal, commandClass:Class, oneShot:Boolean = false):void
        {
            verifyCommandClass( commandClass );
            if ( hasSignalCommand( signal, commandClass ) )
                return;
            var signalCommandMap:Dictionary = signalMap[signal] = signalMap[signal] || new Dictionary( false );
            var callback:Function = function(a:* = null, b:* = null, c:* = null, d:* = null, e:* = null, f:* = null, g:* = null):void
            {
                routeSignalToCommand( signal, arguments, commandClass, oneShot );
            };

            signalCommandMap[commandClass] = callback;
            signal.add( callback );
        }

        public function mapSignalClass(signalClass:Class, commandClass:Class, oneShot:Boolean = false):ISignal
        {
            var signal:ISignal = getSignalClassInstance( signalClass );
            mapSignal( signal, commandClass, oneShot );
            return signal;
        }

        private function getSignalClassInstance(signalClass:Class):ISignal
        {
            return ISignal(signalClassMap[signalClass]) || createSignalClassInstance(signalClass);
        }

        private function createSignalClassInstance(signalClass:Class):ISignal
        {
            var signal:ISignal = injector.instantiate( signalClass );
            injector.mapValue( signalClass, signal );
            signalClassMap[signalClass] = signal;
            return signal;
        }

        public function hasSignalCommand(signal:ISignal, commandClass:Class):Boolean
        {
            var callbacksByCommandClass:Dictionary = signalMap[signal];
            if ( callbacksByCommandClass == null ) return false;
            var callback:Function = callbacksByCommandClass[commandClass];
            return callback != null;
        }

        public function unmapSignal(signal:ISignal, commandClass:Class):void
        {
            var callbacksByCommandClass:Dictionary = signalMap[signal];
            if ( callbacksByCommandClass == null ) return;
            var callback:Function = callbacksByCommandClass[commandClass];
            if ( callback == null ) return;
            signal.remove( callback );
            delete callbacksByCommandClass[commandClass];
        }
		
        public function unmapSignalClass(signalClass:Class, commandClass:Class):void
        {
			unmapSignal(getSignalClassInstance(signalClass), commandClass);
		}

        protected function routeSignalToCommand(signal:ISignal, valueObjects:Array, commandClass:Class, oneshot:Boolean):void
        {
			// NOTE: Assumes no duplicated classes in valueObjects,
			// and none of them are previously mapped.
            var value:Object;
            for each( value in valueObjects )
            {
                injector.mapValue( value.constructor, value );
            }

            var command:Object = injector.instantiate( commandClass );

            for each( value in valueObjects )
            {
                injector.unmap( value.constructor );
            }

            command.execute( );

            if ( oneshot )
            {
                unmapSignal( signal, commandClass );
            }
        }

        protected function verifyCommandClass(commandClass:Class):void
        {
            if ( verifiedCommandClasses[commandClass] ) return;
			if (describeType( commandClass ).factory.method.(@name == "execute").length() != 1)
			{
				throw new ContextError( ContextError.E_COMMANDMAP_NOIMPL + ' - ' + commandClass );
			}
			verifiedCommandClasses[commandClass] = true;
        }
    }
}
