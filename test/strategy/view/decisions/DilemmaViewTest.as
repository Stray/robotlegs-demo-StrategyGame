package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.newloop.util.UnitHelpers;
	import flash.display.SimpleButton;
	import strategy.model.gameplay.IDilemmaVO;
	import strategy.model.gameplay.DilemmaVOSupport;

	public class DilemmaViewTest extends TestCase {
		private var instance:DilemmaView;
		private var optionSubmitted:uint;
		private var dilemmaVO:IDilemmaVO;

		public function DilemmaViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			dilemmaVO = new DilemmaVOSupport(1,2);
			instance = new DilemmaView(dilemmaVO);
			optionSubmitted = 0;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DilemmaView", instance is DilemmaView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_sets_message():void {
			assertEquals("sets question text", dilemmaVO.question, messageField.text);
		}
		
		public function test_sets_title():void {
			assertEquals("sets title text", dilemmaVO.title, titleField.text);
		}
		
		public function test_clicking_either_submit_btn_dispatches_optionSubmittedSignal():void {
			instance.optionSubmittedSignal.add(optionSubmittedHandler);
			UnitHelpers.clickItem(option1Button);
			assertEquals("optionSubmittedSignal fired with correct payload", 1, optionSubmitted);
			UnitHelpers.clickItem(option2Button);
			assertEquals("optionSubmittedSignal fired with correct payload", 2, optionSubmitted);
		}
		
		public function test_verified_visually():void {
			addChild(instance);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}                                       
		
		private function optionSubmittedHandler(optionID:uint):void
		{
			optionSubmitted = optionID;
		}
		
		private function get titleField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'title_txt', 3) as TextField;
		}
		
		private function get messageField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'message_txt', 3) as TextField;
		}
		
		private function get option1Button():SimpleButton {
			return UnitHelpers.findNamedInstance(instance, 'option_1_btn', 3) as SimpleButton;
		}
		
		private function get option2Button():SimpleButton {
			return UnitHelpers.findNamedInstance(instance, 'option_2_btn', 3) as SimpleButton;
		}
	}
}