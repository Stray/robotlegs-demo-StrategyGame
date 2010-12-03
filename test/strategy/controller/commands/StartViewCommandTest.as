package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.display.Sprite;

	public class StartViewCommandTest extends TestCase {
		private var instance:StartViewCommand;

		public function StartViewCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StartViewCommand();
			instance.contextView = new Sprite();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StartViewCommand", instance is StartViewCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
		public function testExecute():void {
			assertTrue("Execute returns void", (instance.execute() == void));
		}
	}
}