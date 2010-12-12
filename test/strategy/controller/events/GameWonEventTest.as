package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class GameWonEventTest extends TestCase {
		private var instance:GameWonEvent;
		private const DAYS_REMAINING:uint = 5;
		private const CASH_REMAINING:Number = 324;

		public function GameWonEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GameWonEvent('testEvent', DAYS_REMAINING, CASH_REMAINING);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GameWonEvent", instance is GameWonEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:GameWonEvent = instance.clone() as GameWonEvent;
			assertTrue("GameWonEvent can be cloned to correct class", clone is GameWonEvent);
			assertTrue("GameWonEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("GameWonEvent.GAME_WON has correct string", GameWonEvent.GAME_WON == 'GameWonEvent.gameWon');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_daysRemaining():void {
			assertEquals("Get daysRemaining", DAYS_REMAINING, instance.daysRemaining);
		}
		
		public function test_get_cashRemaining():void {
			assertEquals("Get cashRemaining", CASH_REMAINING, instance.cashRemaining);
		}
		
	}
}