package <%= package_name %> {

	import asunit.framework.TestCase;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;

	public class <%= class_name %>ContextTest extends TestCase {
		private var instance:<%= class_name %>Context;

		public function <%= class_name %>ContextTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new <%= class_name %>Context();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is <%= class_name %>Context", instance is <%= class_name %>Context);
		}
		
		public function testIsModuleContext():void {
			assertTrue("instance is ModuleContext", instance is ModuleContext);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}