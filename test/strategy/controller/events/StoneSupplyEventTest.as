package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;
	import strategy.model.transactions.StoneTransactionVO;

	public class StoneSupplyEventTest extends TestCase {
		private var instance:StoneSupplyEvent;
		private const MESSAGE:String = 'some message';
		private const VO:StoneTransactionVO = new StoneTransactionVO(0,0);

		public function StoneSupplyEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneSupplyEvent('testEvent', MESSAGE, VO);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneSupplyEvent", instance is StoneSupplyEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:StoneSupplyEvent = instance.clone() as StoneSupplyEvent;
			assertTrue("StoneSupplyEvent can be cloned to correct class", clone is StoneSupplyEvent);
			assertTrue("StoneSupplyEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("StoneSupplyEvent.NO_STONE_OFFERED has correct string", StoneSupplyEvent.NO_STONE_OFFERED == 'StoneSupplyEvent.noStoneOffered');
		   	assertTrue("StoneSupplyEvent.STONE_OFFERED has correct string", StoneSupplyEvent.STONE_OFFERED == 'StoneSupplyEvent.stoneOffered');
		   	assertTrue("StoneSupplyEvent.STONE_DILEMMA has correct string", StoneSupplyEvent.STONE_DILEMMA == 'StoneSupplyEvent.stoneDilemma');
		   	assertTrue("StoneSupplyEvent.STONE_INCIDENT has correct string", StoneSupplyEvent.STONE_INCIDENT == 'StoneSupplyEvent.stoneIncident');
		   	assertTrue("StoneSupplyEvent.STONE_PURCHASED has correct string", StoneSupplyEvent.STONE_PURCHASED == 'StoneSupplyEvent.stonePurchased');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_message():void {
			assertEquals("Get message", MESSAGE, instance.message);
		}
		
		public function test_get_transactionVO():void {
			assertEquals("Get transactionVO", VO, instance.transactionVO);
		}
		
	}
}