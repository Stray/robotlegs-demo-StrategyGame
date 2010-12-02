package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;
	import flash.text.TextField;

	public class ProgressStatusViewTest extends TestCase {
		private var instance:ProgressStatusView;
		private const NEW_VALUE:uint = 23;

		public function ProgressStatusViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ProgressStatusView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ProgressStatusView", instance is ProgressStatusView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_updateStatus_sets_text_in_view():void {     
			instance.updateStatus(NEW_VALUE);
			assertEquals("Update text", NEW_VALUE.toString(), text);
		}
		
		private function get text():String
		{
			var textField:TextField = UnitHelpers.findInstanceOf(instance, TextField, 2);
			return textField.text;
		}
		
	}
}