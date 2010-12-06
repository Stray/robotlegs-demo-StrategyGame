package strategy.view.messages {
	
	import strategy.view.messages.DaySummaryView;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class DaySummaryViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:DaySummaryView;
		
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
		
		public function DaySummaryViewMediator() {			
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
