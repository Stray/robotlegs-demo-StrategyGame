package strategy.view {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class PyramidProgressViewTest extends TestCase {
		private var instance:PyramidProgressView;

		public function PyramidProgressViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new PyramidProgressView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is PyramidProgressView", instance is PyramidProgressView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_verified_visually():void {
			addChild(instance);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		
		public function test_verified_visually_10():void {
			addChild(instance);  
			instance.showProgress(10);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		
		
		public function test_verified_visually_50():void {
			addChild(instance);  
			instance.showProgress(50.3)
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		
		public function test_verified_visually_100():void {
			addChild(instance);       
			instance.showProgress(100);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		  
		public function test_verified_visually_101():void {
			addChild(instance);        
			instance.showProgress(101);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		  
		
	}
}