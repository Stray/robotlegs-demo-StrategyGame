package strategy.view {
	
	import strategy.view.PyramidProgressView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class PyramidProgressViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:PyramidProgressView;
		
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
		
		public function PyramidProgressViewMediator() {			
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
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, buildingProgressUpdatedHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		protected function buildingProgressUpdatedHandler(e:ResourceStatusEvent):void
		{
			trace("PyramidProgressViewMediator::buildingProgressUpdatedHandler()");
			view.showProgress(e.percentage);
		}
	}
}