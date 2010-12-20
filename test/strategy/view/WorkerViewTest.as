package strategy.view {

	import asunit.framework.TestCase;
	import flash.display.Sprite;

	public class WorkerViewTest extends TestCase {
		private var workerView:WorkerView;

		public function WorkerViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			workerView = new WorkerView(workerSprite);
		}

		override protected function tearDown():void {
			super.tearDown();
			workerView = null;
		}

		public function testInstantiated():void {
			assertTrue("workerView is WorkerView", workerView is WorkerView);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		private function get workerSprite():Sprite
		{
			var parentSprite:Sprite = new Sprite();
			var childSprite:Sprite = new Sprite();
			childSprite.name = 'suspended';
			parentSprite.addChild(childSprite);
			return parentSprite;
		}
	}
}