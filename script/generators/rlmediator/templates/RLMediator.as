package <%= package_name %> {
	
	import <%= package_name %>.<%= class_name %>;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class <%= class_name %>Mediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:<%= class_name %>;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function <%= class_name %>Mediator() {			
			// Try not to put stuff in the constructor of the mediator
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			//eventMap.mapListener(eventDispatcher, EventType.EVENT_NAME, eventHandlerFunction);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
	}
}
