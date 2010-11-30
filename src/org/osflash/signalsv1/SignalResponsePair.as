package org.osflash.signalsv1 
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;

	/**
	 * Signal dispatches events to multiple listeners.
	 * It is inspired by C# events and delegates, and by
	 * <a target="_top" href="http://en.wikipedia.org/wiki/Signals_and_slots">signals and slots</a>
	 * in Qt.
	 * A Signal adds event dispatching functionality through composition and interfaces,
	 * rather than inheriting from a dispatcher.
	 * <br/><br/>
	 * Project home: <a target="_top" href="http://github.com/robertpenner/as3-signals/">http://github.com/robertpenner/as3-signals/</a>
	 */
	public class SignalResponsePair extends Signal
	{
		protected var _responseSignal:Signal;
		
		/**
		 * Creates a Signal instance to dispatch value objects.
		 * @param	valueClasses Any number of class references that enable type checks in dispatch().
		 * For example, new Signal(String, uint)
		 * would allow: signal.dispatch("the Answer", 42)
		 * but not: signal.dispatch(true, 42.5)
		 * nor: signal.dispatch()
		 *
		 * NOTE: Subclasses cannot call super.apply(null, valueClasses),
		 * but this constructor has logic to support super(valueClasses).
		 */
		public function SignalResponsePair(requestValueClasses:Array, responseValueClasses:Array)
		{
			// The dispatch will always be the response signal
			setValueClasses(requestValueClasses);
			_responseSignal = new Signal(responseValueClasses)
		}
		
		
		public function get responseSignal():Signal
		{
			return _responseSignal;
		}
		
		public function addToRequest(listener:Function):Function
		{
			return add(listener);
		}
		
		public function addToResponse(listener:Function):Function
		{
			return _responseSignal.add(listener);
		}
		
		public function addToRequestOnce(listener:Function):Function
		{
			return addOnce(listener);
		}
		
		public function addToResponseOnce(listener:Function):Function
		{
			return _responseSignal.addOnce(listener);
		} 
		
		public function removeFromRequest(listener:Function):Function
		{
			return remove(listener);
		}
		
		public function removeFromResponse(listener:Function):Function
		{
			return _responseSignal.remove(listener);
		}
		
		public function removeAllFromRequest():void
		{
			removeAll();
		}
		
		public function removeAllFromResponse():void
		{
			_responseSignal.removeAll();
		}
		
		public function get numRequestListeners():uint
		{
			return numListeners;
		}
		
		public function get numResponseListeners():uint
		{
			return _responseSignal.numListeners;
		}
		
		public function dispatchRequest(...valueObjects):void
		{
			switch (valueObjects.length)
			{
				case 0:
					dispatch();
					break;
					
				case 1:
					dispatch(valueObjects[0]);
					break;
					
				default:
					dispatch.apply(this, valueObjects);
			}
		}
		
		public function dispatchResponse(...valueObjects):void
		{
			switch (valueObjects.length)
			{
				case 0:
					_responseSignal.dispatch();
					break;
					
				case 1:
					_responseSignal.dispatch(valueObjects[0]);
					break;
					
				default:
					_responseSignal.dispatch.apply(_responseSignal, valueObjects);
			}
		}
	}
}
