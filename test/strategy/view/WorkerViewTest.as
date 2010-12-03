package strategy.view {

	import asunit.framework.TestCase;

	public class WorkerViewTest extends TestCase {
		private var workerView:WorkerView;

		public function WorkerViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			workerView = new WorkerView();
		}

		override protected function tearDown():void {
			super.tearDown();
			workerView = null;
		}

		public function testInstantiated():void {
			assertTrue("workerView is WorkerView", workerView is WorkerView);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
	}
}