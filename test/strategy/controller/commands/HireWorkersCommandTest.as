package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.model.resources.ILabourModel;

	import asunit.errors.AssertionFailedError;     

	import mockolate.prepare;
	import mockolate.nice;
	import mockolate.stub;
   	import mockolate.verify;
	import mockolate.errors.VerificationError;
	
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.object.strictlyEqualTo;
	import org.hamcrest.object.hasPropertyWithValue;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;

	public class HireWorkersCommandTest extends TestCase {
		private var instance:HireWorkersCommand;
		
		private var workerVOs:Vector.<WorkerProductivityVO>;

		public function HireWorkersCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new HireWorkersCommand();             
			createWorkerVOs();
			instance.eventDispatcher = new EventDispatcher();
			instance.labourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.WORKERS_HIRED, workerVOs);
			instance.labourModel = nice(ILabourModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is HireWorkersCommand", instance is HireWorkersCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute_appends_payload_to_labour_model():void {
		    instance.execute();
			verify(instance.labourModel).method("appendWorkers").args(equalTo(workerVOs));
		}
		
		public function test_execute_fires_dayCycleEvent():void {
			var handler:Function = addAsync(check_execute_fires_dayCycleEvent, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.LABOUR_HIRE_COMPLETED, handler);
			
			instance.execute();
		}

		private function check_execute_fires_dayCycleEvent(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.LABOUR_HIRE_COMPLETED, e.type);
		}
		
		private function createWorkerVOs():void
		{
			workerVOs = new Vector.<WorkerProductivityVO>();
			var iLength:uint = 2;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextWorker:WorkerProductivityVO = new WorkerProductivityVO(100,200);
				workerVOs.push(nextWorker);
			}
		}
	}
}