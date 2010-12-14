package strategy.model.gameplay.dilemmas {

	import asunit.framework.TestCase;

	public class WeekendWorkingDilemmaTest extends TestCase {
		private var instance:WeekendWorkingDilemma;

		public function WeekendWorkingDilemmaTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new WeekendWorkingDilemma();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is WeekendWorkingDilemma", instance is WeekendWorkingDilemma);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_has_2_options():void {
			assertEquals("Has 2 options", 2, instance.options.length);
		}
		
	}
}