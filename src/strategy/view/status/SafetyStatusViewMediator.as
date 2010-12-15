package strategy.view.status {
	
	import strategy.view.status.SafetyStatusView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class SafetyStatusViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:SafetyStatusView;
		
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
		
		public function SafetyStatusViewMediator() {			
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
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED, safetyUpdatedHandler, ResourceStatusEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
	   
	    private function safetyUpdatedHandler(e:ResourceStatusEvent):void
		{
			view.updateStatus(e.percentage);
		}
	}
}