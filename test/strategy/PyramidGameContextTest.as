package strategy {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Context;

	public class PyramidGameContextTest extends TestCase {
		private var instance:PyramidGameContext;

		public function PyramidGameContextTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new PyramidGameContext();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is PyramidGameContext", instance is PyramidGameContext);
		}
        
		public function testIsContext():void{
			assertTrue("instance is robotlegs Context", instance is Context);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}