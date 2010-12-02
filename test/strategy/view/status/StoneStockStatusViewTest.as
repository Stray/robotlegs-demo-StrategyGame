package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;
	import flash.text.TextField;

	public class StoneStockStatusViewTest extends TestCase {
		private var instance:StoneStockStatusView;
		private const NEW_VALUE:uint = 23;
		private const NEW_CAPACITY_VALUE:uint = 45;
		
		public function StoneStockStatusViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneStockStatusView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneStockStatusView", instance is StoneStockStatusView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
 		public function test_updateStatus_sets_text_in_view():void {     
			instance.updateStatus(NEW_VALUE);
			assertEquals("Update status", NEW_VALUE.toString(), status_text);
		}
		
		public function test_updateCapacity_sets_text_in_view():void {     
			instance.updateCapacity(NEW_CAPACITY_VALUE);
			assertEquals("Update capacity", NEW_CAPACITY_VALUE.toString(), capacity_text);
		}
		
		private function get status_text():String
		{
			var textField:TextField = UnitHelpers.findNamedInstance(instance, "status_txt", 2) as TextField;
			return textField.text;
		}
		
		private function get capacity_text():String
		{
			var textField:TextField = UnitHelpers.findNamedInstance(instance, "capacity_txt", 2) as TextField;
			return textField.text;
		}
		
		
	}
}