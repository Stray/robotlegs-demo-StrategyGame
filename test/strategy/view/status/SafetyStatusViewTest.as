package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;

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
			assertTrue("Failing test", true);
		}
		
		public function test_updateStatus():void {
			instance.updateStatus(100);
			assertEquals("indicator placed correctly for 100", gaugeWidth, indicator.x);
			instance.updateStatus(0);
			assertEquals("indicator placed correctly for 0", 0, indicator.x);
			instance.updateStatus(50);
			assertEquals("indicator placed correctly for 0", gaugeWidth/2, indicator.x);
		}
		 
		public function test_verifiedVisually():void {
			addChild(instance);
			instance.updateStatus(66);
			assertTrue("VerifiedVisually", true);
			removeChild(instance);
		}
		
		
		private function get indicator():Sprite
		{
			return UnitHelpers.findNamedInstance(instance, 'indicator', 3) as Sprite;
		}
		
		private function get gaugeWidth():Number
		{
			var gauge:Sprite = UnitHelpers.findNamedInstance(instance, 'thermometer_background', 3) as Sprite;
			return gauge.width;
		}
		
	}
}