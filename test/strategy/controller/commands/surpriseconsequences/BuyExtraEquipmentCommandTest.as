package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;

	public class BuyExtraEquipmentCommandTest extends TestCase {
		private var instance:BuyExtraEquipmentCommand;

		public function BuyExtraEquipmentCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new BuyExtraEquipmentCommand();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is BuyExtraEquipmentCommand", instance is BuyExtraEquipmentCommand);
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