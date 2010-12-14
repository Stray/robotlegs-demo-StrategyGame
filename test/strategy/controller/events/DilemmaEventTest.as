package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;
	import strategy.model.gameplay.IDilemmaVO;
	import strategy.model.gameplay.DilemmaVOSupport;

	public class DilemmaEventTest extends TestCase {
		private var instance:DilemmaEvent;
		private const DILEMMA_VO:IDilemmaVO = new DilemmaVOSupport();

		public function DilemmaEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DilemmaEvent('testEvent', DILEMMA_VO);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DilemmaEvent", instance is DilemmaEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:DilemmaEvent = instance.clone() as DilemmaEvent;
			assertTrue("DilemmaEvent can be cloned to correct class", clone is DilemmaEvent);
			assertTrue("DilemmaEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("DilemmaEvent.DILEMMA_PRESENTED has correct string", DilemmaEvent.DILEMMA_PRESENTED == 'DilemmaEvent.dilemmaPresented');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_dilemmaVO():void {
			assertEquals("Get dilemmaVO", DILEMMA_VO, instance.dilemmaVO);
		}
		
	}
}