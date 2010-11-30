package org.osflash.signalsv1 
{
	/**
	 * ISignalOwner gives access to the powerful function, removeAll. This should only be called by trusted classes.
	 */
	public interface ISignalOwner extends ISignal, IDispatcher
	{
		/**
		 * Unsubscribes all listeners from the signal.
		 */
		function removeAll():void
	}
}