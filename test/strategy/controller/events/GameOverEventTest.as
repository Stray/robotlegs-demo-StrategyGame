package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class GameOverEventTest extends TestCase {
		private var instance:GameOverEvent;
		private const REASON:String = "Some reason why you failed the game";

		public function GameOverEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GameOverEvent('testEvent', REASON);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GameOverEvent", instance is GameOverEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("instance is Event", instance is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:GameOverEvent = instance.clone() as GameOverEvent;
			assertTrue("GameOverEvent can be cloned to correct class", clone is GameOverEvent);
			assertTrue("GameOverEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("GameOverEvent.GAME_OVER has correct string", GameOverEvent.GAME_OVER == 'GameOverEvent.gameOver');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_reason():void {
			assertEquals("Get reason", REASON, instance.reason);
		}
		
	}
}