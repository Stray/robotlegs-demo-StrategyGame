package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.events.EventDispatcher;
	import strategy.controller.events.GameEvent;

	public class StartGameCommandTest extends TestCase {
		private var instance:StartGameCommand;

		public function StartGameCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StartGameCommand();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StartGameCommand", instance is StartGameCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_fires_gameStarted():void {
			var handler:Function = addAsync(check_execute_fires_gameStarted, 50);
			instance.eventDispatcher.addEventListener(GameEvent.GAME_STARTED, handler);
			
			instance.execute();
		}

		private function check_execute_fires_gameStarted(e:GameEvent):void {
			assertEquals('event is correct type', GameEvent.GAME_STARTED, e.type);
			
		}
	}
}