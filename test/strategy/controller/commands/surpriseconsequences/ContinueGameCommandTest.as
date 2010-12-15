package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;

	public class ContinueGameCommandTest extends TestCase {
		private var instance:ContinueGameCommand;

		public function ContinueGameCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ContinueGameCommand();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ContinueGameCommand", instance is ContinueGameCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_dispatches_dayEndedEvent():void {
			var handler:Function = addAsync(check_execute_dispatches_dayEndedEvent, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.DAY_ENDED, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_dayEndedEvent(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.DAY_ENDED, e.type);
			
		}
	}
}