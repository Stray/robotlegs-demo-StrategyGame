package strategy.model.markets {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class StonePriceMarketTest extends TestCase {
		private var instance:StonePriceMarket;

		public function StonePriceMarketTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StonePriceMarket();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StonePriceMarket", instance is StonePriceMarket);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}