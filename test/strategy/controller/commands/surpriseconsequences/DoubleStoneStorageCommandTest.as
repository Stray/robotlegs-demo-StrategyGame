package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;

	public class DoubleStoneStorageCommandTest extends TestCase {
		private var instance:DoubleStoneStorageCommand;

		public function DoubleStoneStorageCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DoubleStoneStorageCommand();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DoubleStoneStorageCommand", instance is DoubleStoneStorageCommand);
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