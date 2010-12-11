package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.display.Sprite;
	import strategy.controller.events.GameEvent;

	public class RestartGameCommandTest extends TestCase {
		private var instance:RestartGameCommand;

		public function RestartGameCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new RestartGameCommand();
			instance.contextView = new Sprite();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is RestartGameCommand", instance is RestartGameCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_fires_game_restarted_event_on_contextView():void {
			var handler:Function = addAsync(check_execute_fires_game_restarted_event_on_contextView, 50);
			instance.contextView.addEventListener(GameEvent.GAME_RESTARTED, handler);
			
			instance.execute();
		}

		private function check_execute_fires_game_restarted_event_on_contextView(e:GameEvent):void {
			assertEquals('event is correct type', GameEvent.GAME_RESTARTED, e.type);
			
		}
	}
}