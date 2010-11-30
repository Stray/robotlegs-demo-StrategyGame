package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class ResourceStatusEventTest extends TestCase {
		private var instance:ResourceStatusEvent; 
		private const VALUE:Number = 50;
		private const PERCENTAGE:Number = 85.8;

		public function ResourceStatusEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ResourceStatusEvent('testEvent', VALUE, PERCENTAGE);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ResourceStatusEvent", instance is ResourceStatusEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:ResourceStatusEvent = instance.clone() as ResourceStatusEvent;
			assertTrue("ResourceStatusEvent can be cloned to correct class", clone is ResourceStatusEvent);
			assertTrue("ResourceStatusEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("ResourceStatusEvent.BUILDING_PROGRESS_UPDATED has correct string", ResourceStatusEvent.BUILDING_PROGRESS_UPDATED == 'ResourceStatusEvent.buildingProgressUpdated');
		   	assertTrue("ResourceStatusEvent.CASH_UPDATED has correct string", ResourceStatusEvent.CASH_UPDATED == 'ResourceStatusEvent.cashUpdated');
		   	assertTrue("ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED has correct string", ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED == 'ResourceStatusEvent.healthAndSafetyUpdated');
		   	assertTrue("ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED has correct string", ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED == 'ResourceStatusEvent.environmentalImpactUpdated');
		   	assertTrue("ResourceStatusEvent.CALENDAR_UPDATED has correct string", ResourceStatusEvent.CALENDAR_UPDATED == 'ResourceStatusEvent.calendarUpdated');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_value():void {
			assertEquals("Get value", VALUE, instance.value);
		}
		
		public function test_get_percentage():void {
			assertEquals("Get percentage", PERCENTAGE, instance.percentage);
		}
		
	}
}