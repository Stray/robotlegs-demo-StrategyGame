package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.events.EventDispatcher;
	import strategy.controller.events.DayCycleEvent;

	public class SkipHireWorkersCommandTest extends TestCase {
		private var instance:SkipHireWorkersCommand;

		public function SkipHireWorkersCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SkipHireWorkersCommand();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is SkipHireWorkersCommand", instance is SkipHireWorkersCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_fires_dayCycleEvent():void {
			var handler:Function = addAsync(check_execute_fires_dayCycleEvent, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.LABOUR_HIRE_COMPLETED, handler);
			
			instance.execute();
		}

		private function check_execute_fires_dayCycleEvent(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.LABOUR_HIRE_COMPLETED, e.type);
		}
	}
}