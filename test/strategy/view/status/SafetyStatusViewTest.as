package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class SafetyStatusViewTest extends TestCase {
		private var instance:SafetyStatusView;

		public function SafetyStatusViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SafetyStatusView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is SafetyStatusView", instance is SafetyStatusView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}