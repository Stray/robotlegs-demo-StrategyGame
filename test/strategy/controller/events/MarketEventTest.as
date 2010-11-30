package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class MarketEventTest extends TestCase {
		private var instance:MarketEvent;

		public function MarketEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new MarketEvent('testEvent');
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is MarketEvent", instance is MarketEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:MarketEvent = instance.clone() as MarketEvent;
			assertTrue("MarketEvent can be cloned to correct class", clone is MarketEvent);
			assertTrue("MarketEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	//assertTrue("MarketEvent.EVENT_TYPE has correct string", MarketEvent.EVENT_TYPE == 'eventType');
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}