package strategy.model {

	import asunit.framework.TestCase;

	public class FirstGameConfigTest extends TestCase {
		private var instance:FirstGameConfig;

		public function FirstGameConfigTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new FirstGameConfig();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is FirstGameConfig", instance is FirstGameConfig);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
	}
}