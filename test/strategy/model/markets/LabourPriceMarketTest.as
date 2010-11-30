package strategy.model.markets {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class LabourPriceMarketTest extends TestCase {
		private var instance:LabourPriceMarket;

		public function LabourPriceMarketTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourPriceMarket();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourPriceMarket", instance is LabourPriceMarket);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}