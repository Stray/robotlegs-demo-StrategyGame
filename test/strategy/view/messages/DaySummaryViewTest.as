package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import com.newloop.util.UnitHelpers;

	public class DaySummaryViewTest extends TestCase {
		private var instance:DaySummaryView;
		private const BLOCKS_BUILT:Number = 345;
		private const WAGES_PAID:Number = 250;

		public function DaySummaryViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DaySummaryView(BLOCKS_BUILT, WAGES_PAID);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DaySummaryView", instance is DaySummaryView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		} 
		
		public function test_sets_cost():void { 
			assertEquals("Set cost updates text", WAGES_PAID.toString() + " coins", costField.text);
		}
		
		public function test_sets_quantity():void {
			assertEquals("Set quantity updates text", BLOCKS_BUILT.toString(), quantityField.text);
		}
		
		private function get quantityField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'quantity_txt', 3) as TextField;
		}                                                                                  
		
		private function get costField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'cost_txt', 3) as TextField;
		}
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		}
		
	}
}