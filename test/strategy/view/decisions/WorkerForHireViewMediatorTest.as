package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.controller.events.LabourSupplyEvent;

	public class WorkerForHireViewMediatorTest extends TestCase {
		private var instanceMediator:WorkerForHireViewMediator;
        private const WORKER_VO:WorkerProductivityVO = new WorkerProductivityVO(100, 200);

		public function WorkerForHireViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new WorkerForHireViewMediator();
			instanceMediator.view = new WorkerForHireView(WORKER_VO);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is WorkerForHireViewMediator", instanceMediator is WorkerForHireViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_submit_signal_from_view_dispatches_workers_hired_event():void {
			var handler:Function = addAsync(check_submit_signal_from_view_dispatches_workers_hired_event, 50);
			instanceMediator.eventDispatcher.addEventListener(LabourSupplyEvent.WORKERS_HIRED, handler);
			
			instanceMediator.view.submitSignal.dispatch(WORKER_VO);
		}

		private function check_submit_signal_from_view_dispatches_workers_hired_event(e:LabourSupplyEvent):void {
			assertEquals('event is correct type', LabourSupplyEvent.WORKERS_HIRED, e.type);
			var workersVectorExpected:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			workersVectorExpected.push(WORKER_VO);
			assertEqualsVectorsIgnoringOrder('puts vo into vector', workersVectorExpected, e.workers);
			
		}
		
		
	}
}