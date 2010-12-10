package strategy.view.decisions {
	
	import strategy.view.decisions.WorkerForHireView;
	
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	
	public class WorkerForHireViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:WorkerForHireView;
		
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
		
		public function WorkerForHireViewMediator() {			
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
			addToSignal(view.submitSignal, submitHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		protected function submitHandler(workerVO:WorkerProductivityVO):void
		{
			var workersVector:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			workersVector.push(workerVO);
			var evt:LabourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.WORKERS_HIRED, workersVector);
			dispatch(evt);
		}
	}
}