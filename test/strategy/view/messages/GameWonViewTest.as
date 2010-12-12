package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import com.newloop.util.UnitHelpers;

	public class GameWonViewTest extends TestCase {
		private var instance:GameWonView;
		private var _submitReceived:Boolean;

		private const CASH:Number = 234;
		private const DAYS:uint = 3;

		public function GameWonViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GameWonView(DAYS, CASH);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GameWonView", instance is GameWonView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_sets_days():void { 
			assertEquals("Set days updates text", DAYS.toString() + " days", daysField.text);
		}
		
    	public function test_sets_cash():void { 
			assertEquals("Set cash updates text", CASH.toString() + " coins", cashField.text);
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
		
		private function get daysField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'days_txt', 3) as TextField;
		} 
		
		private function get cashField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'cost_txt', 3) as TextField;
		}                                                                                 
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		}
	}
}