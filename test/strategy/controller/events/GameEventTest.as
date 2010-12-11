package strategy.controller.events {

	import asunit.framework.TestCase;
	
	import flash.events.Event;

	public class GameEventTest extends TestCase {
		private var gameEvent:GameEvent;

		public function GameEventTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			gameEvent = new GameEvent('testEvent');
		}

		override protected function tearDown():void {
			super.tearDown();
			gameEvent = null;
		}

		public function testInstantiated():void {
			assertTrue("gameEvent is GameEvent", gameEvent is GameEvent);
		}
        
		public function testIsEvent():void{
			assertTrue("gameEvent is Event", gameEvent is Event);
		}
        
        public function testCloneReturnsSameEvent():void{
	    	var eventType:String = "testEvent";
			var clone:GameEvent = gameEvent.clone() as GameEvent;
			assertTrue("GameEvent can be cloned to correct class", clone is GameEvent);
			assertTrue("GameEvent clone retains event type", clone.type == "testEvent");
		}
		
		public function testEventStrings():void{
		   	assertTrue("GameEvent.GAME_STARTED has correct string", GameEvent.GAME_STARTED == 'GameEvent.gameStarted');
		   	assertTrue("GameEvent.GAME_RESTARTED has correct string", GameEvent.GAME_RESTARTED == 'GameEvent.gameRestarted');
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}