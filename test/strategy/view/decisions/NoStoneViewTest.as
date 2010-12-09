package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import com.newloop.util.UnitHelpers;

	public class NoStoneViewTest extends TestCase {
		private var instance:NoStoneView;

		private const MESSAGE:String = "Oh deary dear, things aren't quite normal!"
		
		private var submitFired:Boolean;

		public function NoStoneViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new NoStoneView(MESSAGE);
			submitFired = false;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is NoStoneView", instance is NoStoneView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_sets_message():void {
			assertEquals("Set message updates text", MESSAGE, messageField.text);
		}
		
		public function test_visually():void {
			//addChild(instance);
			assertTrue("visually verified", true);
		}
		
		public function test_submit_signal_fired_after_submit_clicked():void {
        	instance.submitSignal.add(submit_signal_handler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Submit signal received", submitFired);
		}
		
		private function submit_signal_handler():void
		{
			submitFired = true;
		}
		
	    private function get messageField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'message_txt', 3) as TextField;
		}
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		}
		
	}
}