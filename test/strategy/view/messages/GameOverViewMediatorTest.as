package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.GameEvent;

	public class GameOverViewMediatorTest extends TestCase {
		private var instanceMediator:GameOverViewMediator;

		public function GameOverViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new GameOverViewMediator();
			instanceMediator.view = new GameOverView('test message');
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is GameOverViewMediator", instanceMediator is GameOverViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_submitSignal_from_view_fires_GameRestarted_event():void {
			var handler:Function = addAsync(check_submitSignal_from_view_fires_GameRestarted_event, 50);
			instanceMediator.eventDispatcher.addEventListener(GameEvent.GAME_RESTARTED, handler);
			
			instanceMediator.view.submitSignal.dispatch();
		}

		private function check_submitSignal_from_view_fires_GameRestarted_event(e:GameEvent):void {
			assertEquals('event is correct type', GameEvent.GAME_RESTARTED, e.type);
			
		}
		
	}
}