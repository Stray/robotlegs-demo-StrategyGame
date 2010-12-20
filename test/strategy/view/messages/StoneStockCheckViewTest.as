package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;
	import flash.text.TextField;
	import flash.display.SimpleButton;

	public class StoneStockCheckViewTest extends TestCase {
		private var instance:StoneStockCheckView;
		private const QUANTITY:Number = 212;
		private var _submitReceived:Boolean;

		public function StoneStockCheckViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneStockCheckView(QUANTITY, true);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneStockCheckView", instance is StoneStockCheckView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		} 
		
		public function test_sets_quantity():void { 
			assertEquals("Set quantity updates text", QUANTITY.toString() + " stones", quantityField.text);
		}
		
		public function test_pressing_submit_dispatches_signal():void {
			_submitReceived = false;
			instance.submitSignal.add(submitSignalHandler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Submit signal dispatched", _submitReceived);
		} 
		
		private function submitSignalHandler():void {
			_submitReceived = true;
		}                                           
		
		private function get quantityField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'quantity_txt', 3) as TextField;
		}                                                                                  
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		}
		
		public function test_verified_visually():void { 
			addChild(instance);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		
		
	}
}