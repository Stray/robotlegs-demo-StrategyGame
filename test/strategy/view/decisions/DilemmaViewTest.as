package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import com.newloop.util.UnitHelpers;
	import flash.display.SimpleButton;
	import strategy.model.gameplay.IDilemmaVO;
	import strategy.model.gameplay.DilemmaVOSupport;
	import strategy.model.gameplay.dilemmas.WeekendWorkingDilemma;
	import strategy.model.gameplay.IOptionVO;

	public class DilemmaViewTest extends TestCase {
		private var instance:DilemmaView;
		private var optionSubmitted:uint;
		private var payloadSubmitted:*;
		private var dilemmaVO:IDilemmaVO;

		public function DilemmaViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			dilemmaVO = new WeekendWorkingDilemma();
			instance = new DilemmaView(dilemmaVO);
			optionSubmitted = 0;
			payloadSubmitted = null;
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
			
			var options:Vector.<IOptionVO> = dilemmaVO.options;
			var payload1:* = options[0].payload;
			var payload2:* = options[1].payload;
			
			assertEquals("optionSubmittedSignal fired with correct id", 1, optionSubmitted);
			assertEquals("optionSubmittedSignal fired with correct payload", payload1, payloadSubmitted);
			UnitHelpers.clickItem(option2Button);
			assertEquals("optionSubmittedSignal fired with correct id", 2, optionSubmitted);
			assertEquals("optionSubmittedSignal fired with correct payload", payload2, payloadSubmitted);
			
		}
		
		public function test_adds_image():void {
			assertEquals("Has added correct image", dilemmaVO.image, instance.getChildAt(instance.numChildren-1));
		}
		
		
		public function test_verified_visually():void {
			addChild(instance);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}                                       
		
		private function optionSubmittedHandler(optionID:uint, payload:Object):void
		{
			optionSubmitted = optionID;
			payloadSubmitted = payload;
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