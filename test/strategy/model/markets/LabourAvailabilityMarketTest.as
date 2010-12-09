package strategy.model.markets {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class LabourAvailabilityMarketTest extends TestCase {
		private var instance:LabourAvailabilityMarket;

		public function LabourAvailabilityMarketTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourAvailabilityMarket();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourAvailabilityMarket", instance is LabourAvailabilityMarket);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}