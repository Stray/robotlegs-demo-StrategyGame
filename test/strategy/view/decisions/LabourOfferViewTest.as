package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;
	import strategy.view.decisions.WorkerForHireView;
	import strategy.model.transactions.WorkerProductivityVO;
	import flash.display.SimpleButton;

	public class LabourOfferViewTest extends TestCase {
		private var instance:LabourOfferView;
   		private var _signalFired:Boolean; 

		public function LabourOfferViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp(); 
			_signalFired = false;
			instance = new LabourOfferView(null);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourOfferView", instance is LabourOfferView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_adds_one_worker():void {   
			instance = new LabourOfferView(createWorkersVOVectorOfLength(1));
			assertEquals("Adds one worker", 1, numberOfWorkersAdded);
		}
		
		public function test_adds_two_workers():void {   
			instance = new LabourOfferView(createWorkersVOVectorOfLength(2));
			assertEquals("Adds one worker", 2, numberOfWorkersAdded);
		}
		
		public function test_adds_three_workers():void {   
			instance = new LabourOfferView(createWorkersVOVectorOfLength(3));
			assertEquals("Adds one worker", 3, numberOfWorkersAdded);
		}
		
		public function test_adds_three_workers_if_too_many_requested():void {   
			instance = new LabourOfferView(createWorkersVOVectorOfLength(4));
			assertEquals("Adds one worker", 3, numberOfWorkersAdded);
		}
		
		public function test_clicking_submit_fires_signal():void {
			instance.submitSignal.add(submitHandler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Clicking submit fires signal", _signalFired);
		}
		
		public function test_verified_visually():void {
			instance = new LabourOfferView(createWorkersVOVectorOfLength(3));
			addChild(instance);
			assertTrue("Verified visually", true);
			removeChild(instance);
		}
		                          
		private function submitHandler():void {
			_signalFired = true;
		}
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findNamedInstance(instance, "submit_btn") as SimpleButton;
		}
		
		private function get numberOfWorkersAdded():uint
		{
			return UnitHelpers.countInstancesOf(instance, WorkerForHireView);
		}
		
		private function createWorkersVOVectorOfLength(noOfWorkers:uint):Vector.<WorkerProductivityVO>
		{
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			var iLength:uint = noOfWorkers;
			for (var i:int = 0; i < iLength; i++)
			{
				var workerVO:WorkerProductivityVO = new WorkerProductivityVO(i*100, i*200);
				workers.push(workerVO);
			}
			return workers;
		}
		
	}
}