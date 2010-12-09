package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;
	import strategy.model.transactions.WorkerProductivityVO;

	public class LabourSupplyEventTest extends TestCase {
		private var instance:LabourSupplyEvent;
        
		private const WORKER_VECTOR:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();

		public function LabourSupplyEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourSupplyEvent('testEvent', WORKER_VECTOR);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourSupplyEvent", instance is LabourSupplyEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:LabourSupplyEvent = instance.clone() as LabourSupplyEvent;
			assertTrue("LabourSupplyEvent can be cloned to correct class", clone is LabourSupplyEvent);
			assertTrue("LabourSupplyEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("LabourSupplyEvent.WORKERS_OFFERED has correct string", LabourSupplyEvent.WORKERS_OFFERED == 'LabourSupplyEvent.workersOffered');
		   	assertTrue("LabourSupplyEvent.WORKERS_HIRED has correct string", LabourSupplyEvent.WORKERS_HIRED == 'LabourSupplyEvent.workersHired');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_workers():void {
			assertEquals("Get workers", WORKER_VECTOR, instance.workers);
		}
		
	}
}