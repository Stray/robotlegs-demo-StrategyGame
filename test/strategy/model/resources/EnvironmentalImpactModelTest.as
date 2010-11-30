package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class EnvironmentalImpactModelTest extends TestCase {
		private var instance:EnvironmentalImpactModel;

		public function EnvironmentalImpactModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new EnvironmentalImpactModel();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is EnvironmentalImpactModel", instance is EnvironmentalImpactModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}