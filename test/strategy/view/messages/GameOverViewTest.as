package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import com.newloop.util.UnitHelpers;

	public class GameOverViewTest extends TestCase {
		private var instance:GameOverView;
		
		private const MESSAGE:String = "A test message";
		private var _submitReceived:Boolean;

		public function GameOverViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GameOverView(MESSAGE);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GameOverView", instance is GameOverView);
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
		
		public function test_pressing_submit_dispatches_signal():void {
			_submitReceived = false;
			instance.submitSignal.add(submitSignalHandler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Submit signal dispatched", _submitReceived);
		} 
		
		private function submitSignalHandler():void {
			_submitReceived = true;
		}                                           
		
		private function get messageField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'message_txt', 3) as TextField;
		}                                                                                  
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		} 
		
	}
}