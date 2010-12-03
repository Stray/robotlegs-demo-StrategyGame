package strategy {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class PyramidGameViewTest extends TestCase {
		private var instance:PyramidGameView;

		public function PyramidGameViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new PyramidGameView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is PyramidGameView", instance is PyramidGameView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}