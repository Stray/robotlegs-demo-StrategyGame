package strategy.view.status {
	
	import strategy.view.status.StoneStockStatusView;
	
	import org.robotlegs.mvcs.Mediator;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class StoneStockStatusViewMediator extends Mediator {
		
		// declare the view to be injected
		[Inject]
		public var view:StoneStockStatusView;
		
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
		
		public function StoneStockStatusViewMediator() {			
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
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.STONE_SUPPLY_UPDATED, updateHandler);
			eventMap.mapListener(eventDispatcher, ResourceStatusEvent.STONE_CAPACITY_UPDATED, updateCapacityHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		private function updateHandler(e:ResourceStatusEvent):void
		{
			view.updateStatus(e.value);
		} 
		
		private function updateCapacityHandler(e:ResourceStatusEvent):void
		{
			view.updateCapacity(e.value);
		}
		
	}
}