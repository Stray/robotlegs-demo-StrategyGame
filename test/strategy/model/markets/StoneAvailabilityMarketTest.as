package strategy.model.markets {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class StoneAvailabilityMarketTest extends TestCase {
		private var instance:StoneAvailabilityMarket;

		public function StoneAvailabilityMarketTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneAvailabilityMarket();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneAvailabilityMarket", instance is StoneAvailabilityMarket);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}