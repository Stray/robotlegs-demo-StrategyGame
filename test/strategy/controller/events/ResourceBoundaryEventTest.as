package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class ResourceBoundaryEventTest extends TestCase {
		private var instance:ResourceBoundaryEvent;

		public function ResourceBoundaryEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ResourceBoundaryEvent('testEvent');
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ResourceBoundaryEvent", instance is ResourceBoundaryEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:ResourceBoundaryEvent = instance.clone() as ResourceBoundaryEvent;
			assertTrue("ResourceBoundaryEvent can be cloned to correct class", clone is ResourceBoundaryEvent);
			assertTrue("ResourceBoundaryEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("ResourceBoundaryEvent.TARGET_REACHED has correct string", ResourceBoundaryEvent.TARGET_REACHED == 'ResourceBoundaryEvent.targetReached');
		   	assertTrue("ResourceBoundaryEvent.BOUNDARY_BREACHED has correct string", ResourceBoundaryEvent.BOUNDARY_BREACHED == 'ResourceBoundaryEvent.boundaryBreached');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}