package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;
	import strategy.model.transactions.DailyProductivityVO;

	public class DailyProgressEventTest extends TestCase {
		private var instance:DailyProgressEvent;
		private const PRODUCTIVITY_VO:DailyProductivityVO = new DailyProductivityVO(100,50);

		public function DailyProgressEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DailyProgressEvent('testEvent', PRODUCTIVITY_VO);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DailyProgressEvent", instance is DailyProgressEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:DailyProgressEvent = instance.clone() as DailyProgressEvent;
			assertTrue("DailyProgressEvent can be cloned to correct class", clone is DailyProgressEvent);
			assertTrue("DailyProgressEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("DailyProgressEvent.PROGRESS_CALCULATED has correct string", DailyProgressEvent.PROGRESS_CALCULATED == 'DailyProgressEvent.progressCalculated');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_productivityVO():void {
			assertEquals("Get productivityVO", PRODUCTIVITY_VO, instance.productivityVO);
		}
		
	}
}