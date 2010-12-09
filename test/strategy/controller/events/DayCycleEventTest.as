package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class DayCycleEventTest extends TestCase {
		private var instance:DayCycleEvent;

		public function DayCycleEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DayCycleEvent('testEvent');
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DayCycleEvent", instance is DayCycleEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:DayCycleEvent = instance.clone() as DayCycleEvent;
			assertTrue("DayCycleEvent can be cloned to correct class", clone is DayCycleEvent);
			assertTrue("DayCycleEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("DayCycleEvent.NEW_DAY_STARTED has correct string", DayCycleEvent.NEW_DAY_STARTED == 'DayCycleEvent.newDayStarted');
		   	assertTrue("DayCycleEvent.STONE_DELIVERY_COMPLETED has correct string", DayCycleEvent.STONE_DELIVERY_COMPLETED == 'DayCycleEvent.stoneDeliveryCompleted');
		   	assertTrue("DayCycleEvent.PROGRESS_CALCULATED has correct string", DayCycleEvent.PROGRESS_CALCULATED == 'DayCycleEvent.progressCalculated');
		   	assertTrue("DayCycleEvent.DAY_ENDED has correct string", DayCycleEvent.DAY_ENDED == 'DayCycleEvent.dayEnded');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}