package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import strategy.model.transactions.WorkerProductivityVO;
	import com.newloop.util.UnitHelpers;
	import flash.display.SimpleButton;
	import flash.text.TextField;

	public class WorkerForHireViewTest extends TestCase {
		private var instance:WorkerForHireView; 
		private const BLOCKS_BUILT:Number = 100;
		private const WAGES:Number = 313;
		private var _signalFired:Boolean; 

		public function WorkerForHireViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			_signalFired = false;
			var workerVO:WorkerProductivityVO = new WorkerProductivityVO(BLOCKS_BUILT, WAGES);
		    instance = new WorkerForHireView(workerVO);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is WorkerForHireView", instance is WorkerForHireView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_sets_quantity():void {
			assertEquals("Sets quantity", BLOCKS_BUILT, quantityField.text);
		}
		
		public function test_sets_price():void {
			assertEquals("Sets price", WAGES, priceField.text);
		}
		
		public function test_validate_visually():void {
			addChild(instance);
			assertTrue("Validate visually", true);
			removeChild(instance);
		}
		
		public function test_clicking_submit_fires_signal():void {
			instance.submitSignal.add(submitHandler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Clicking submit fires signal", _signalFired);
		}
		
		private function submitHandler(workerVO:WorkerProductivityVO):void {
			assertEquals('sends back correct vo blocks', BLOCKS_BUILT, workerVO.stonesBuilt);
			assertEquals('sents back correct vo price', WAGES, workerVO.wagesPaid);
			_signalFired = true;
		}
		
		private function get quantityField():TextField {
			return UnitHelpers.findNamedInstance(instance, "quantity_txt") as TextField;
		}
		
		private function get priceField():TextField {
			return UnitHelpers.findNamedInstance(instance, "price_txt") as TextField;
		}
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findNamedInstance(instance, "submit_btn") as SimpleButton;
		}
		
	}
}