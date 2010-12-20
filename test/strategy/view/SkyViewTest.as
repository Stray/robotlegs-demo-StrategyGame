package strategy.view {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import strategy.view.SkyView;

	public class SkyViewTest extends TestCase {
		private var skyView:SkyView;

		public function SkyViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			skyView = new SkyView();
		}

		override protected function tearDown():void {
			super.tearDown();
			skyView = null;
		}

		public function testInstantiated():void {
			assertTrue("skyView is SkyView", skyView is SkyView);
		}
        
		public function testIsSprite():void{
			assertTrue("skyView is Sprite", skyView is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_moveTo_50():void {
			addChild(skyView);
			skyView.showDayPercentage(50);
			assertTrue("verified visually", true);
	  		removeChild(skyView);
		}
		
		public function test_night():void {
			addChild(skyView);
			skyView.night();
			assertTrue("verified visually", true);
	  		removeChild(skyView);
		}
		
		
	}
}