package <%= package_name %> {

	import asunit.framework.TestCase;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;

	public class <%= class_name %>Test extends TestCase {
		private var instance:<%= class_name %>;

		public function <%= class_name %>Test(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new <%= class_name %>();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is <%= class_name %>", instance is <%= class_name %>);
		}
		
		public function testIsModuleContextView():void {
			assertTrue("instance is ModuleContextView", instance is ModuleContextView);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}