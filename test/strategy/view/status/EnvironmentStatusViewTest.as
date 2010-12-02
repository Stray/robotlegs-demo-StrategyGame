package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class EnvironmentStatusViewTest extends TestCase {
		private var instance:EnvironmentStatusView;

		public function EnvironmentStatusViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new EnvironmentStatusView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is EnvironmentStatusView", instance is EnvironmentStatusView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}