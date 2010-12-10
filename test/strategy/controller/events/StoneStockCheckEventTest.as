package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class StoneStockCheckEventTest extends TestCase {
		private var instance:StoneStockCheckEvent;
		private const QUANTITY:Number = 100;

		public function StoneStockCheckEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneStockCheckEvent('testEvent', QUANTITY);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneStockCheckEvent", instance is StoneStockCheckEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:StoneStockCheckEvent = instance.clone() as StoneStockCheckEvent;
			assertTrue("StoneStockCheckEvent can be cloned to correct class", clone is StoneStockCheckEvent);
			assertTrue("StoneStockCheckEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("StoneStockCheckEvent.STOCK_STOLEN has correct string", StoneStockCheckEvent.STOCK_STOLEN == 'StoneStockCheckEvent.stockStolen');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_quantity():void {
			assertEquals("Get quantity", QUANTITY, instance.quantity);
		}
		
	}
}