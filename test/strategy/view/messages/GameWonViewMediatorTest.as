package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.GameEvent;

	public class GameWonViewMediatorTest extends TestCase {
		private var instanceMediator:GameWonViewMediator;

		public function GameWonViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new GameWonViewMediator();
			instanceMediator.view = new GameWonView(5, 100);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is GameWonViewMediator", instanceMediator is GameWonViewMediator);
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