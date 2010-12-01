package strategy.controller.surprises {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import flash.events.EventDispatcher;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;

	import asunit.errors.AssertionFailedError;     

	import mockolate.prepare;
	import mockolate.nice;
	import mockolate.stub;
   	import mockolate.verify;
	import mockolate.errors.VerificationError;
	
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.object.strictlyEqualTo;
	import org.hamcrest.object.hasPropertyWithValue;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import strategy.model.markets.StonePriceMarket;
	import strategy.model.markets.StoneAvailabilityMarket;

	public class StoneSurpriseEventCasterTest extends TestCase {
		private var instance:StoneSurpriseEventCaster;

		public function StoneSurpriseEventCasterTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IStonePriceMarket, IStoneAvailabilityMarket);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneSurpriseEventCaster();
			instance.eventDispatcher = new EventDispatcher();
			instance.stoneAvailabilityMarket = new StoneAvailabilityMarket();
			instance.stonePriceMarket = new StonePriceMarket();
			instance.surprisePercentageProbability = 0.5;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneSurpriseEventCaster", instance is StoneSurpriseEventCaster);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}