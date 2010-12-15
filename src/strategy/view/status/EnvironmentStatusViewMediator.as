package strategy.view.status {
	
	import strategy.view.status.EnvironmentStatusView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class EnvironmentStatusViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:EnvironmentStatusView;
		
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
		
		public function EnvironmentStatusViewMediator() {			
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
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED, impactUpdateHandler, ResourceStatusEvent);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function impactUpdateHandler(e:ResourceStatusEvent):void
		{
			view.updateStatus(e.percentage);
		}
	}
}