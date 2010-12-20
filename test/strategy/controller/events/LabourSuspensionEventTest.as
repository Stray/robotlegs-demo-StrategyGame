package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class LabourSuspensionEventTest extends TestCase {
		private var instance:LabourSuspensionEvent;                       
		private const STATUS_VECTOR:Vector.<Boolean> = new Vector.<Boolean>();

		public function LabourSuspensionEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourSuspensionEvent('testEvent', STATUS_VECTOR);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourSuspensionEvent", instance is LabourSuspensionEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:LabourSuspensionEvent = instance.clone() as LabourSuspensionEvent;
			assertTrue("LabourSuspensionEvent can be cloned to correct class", clone is LabourSuspensionEvent);
			assertTrue("LabourSuspensionEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("LabourSuspensionEvent.WORKER_SUSPENSIONS_UPDATED has correct string", LabourSuspensionEvent.WORKER_SUSPENSIONS_UPDATED == 'LabourSuspensionEvent.workerSuspensionsUpdated');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_workerStatus():void {
			assertEquals("Get workerStatus", STATUS_VECTOR, instance.workerStatus);
		}
		
	}
}