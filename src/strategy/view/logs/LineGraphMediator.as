package strategy.view.logs {
	
	import strategy.view.logs.LineGraph;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LineGraphMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:LineGraph;
		
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
		
		public function LineGraphMediator() {			
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
