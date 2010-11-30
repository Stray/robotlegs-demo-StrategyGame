package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class HealthAndSafetyModelTest extends TestCase {
		private var instance:HealthAndSafetyModel;

		public function HealthAndSafetyModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new HealthAndSafetyModel();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is HealthAndSafetyModel", instance is HealthAndSafetyModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}