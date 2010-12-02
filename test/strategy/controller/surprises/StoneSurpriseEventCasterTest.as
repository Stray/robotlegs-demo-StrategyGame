package strategy.controller.surprises {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import flash.events.EventDispatcher;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;

	import asunit.errors.AssertionFailedError;     

	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import strategy.model.markets.StonePriceMarket;
	import strategy.model.markets.StoneAvailabilityMarket;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;

	public class StoneSurpriseEventCasterTest extends TestCase {
		private var instance:StoneSurpriseEventCaster;

		public function StoneSurpriseEventCasterTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneSurpriseEventCaster(); 
			var eventDispatcher:EventDispatcher = new EventDispatcher();
			instance.eventDispatcher = eventDispatcher;
			instance.stoneAvailabilityMarket = new StoneAvailabilityMarket();
			instance.stonePriceMarket = new StonePriceMarket();
			instance.stonePriceMarket.eventDispatcher = eventDispatcher;
			instance.stoneAvailabilityMarket.eventDispatcher = eventDispatcher;
			instance.surprisePercentageProbability = 50;  
			instance.primeSurpriseEvents();
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
			assertTrue("Failing test", true);
		}
		
		public function test_castSurpriseEvent_fires_all_normal_events_for_p_0():void {
			instance.surprisePercentageProbability = 0;
			
			var handler:Function = addAsync(check_castSurpriseEvent_fires_all_normal_events_for_p_0, 50);
			instance.eventDispatcher.addEventListener(StoneSupplyEvent.STONE_OFFERED, handler);
			
			instance.castSurpriseEvent();
		}

		private function check_castSurpriseEvent_fires_all_normal_events_for_p_0(e:StoneSupplyEvent):void {
			assertEquals('event is correct type', StoneSupplyEvent.STONE_OFFERED, e.type);
			var transactionVO:StoneTransactionVO = e.transactionVO;
			assertEquals("price correct", instance.stonePriceMarket.currentValue, transactionVO.price);
			assertEquals("availability set correctly", instance.stoneAvailabilityMarket.currentValue, transactionVO.quantity);
		}
		
		public function test_castSurpriseEvent_fires_all_special_events_for_p_1():void {
			instance.surprisePercentageProbability = 100;
			
			var failHandler:Function = addAsync(fail_if_stone_offered_fired, 50, handle_stone_offered_fail);
			instance.eventDispatcher.addEventListener(StoneSupplyEvent.STONE_OFFERED, failHandler);
			
			var handler:Function = addAsync(check_surprise_event, 50);
			instance.eventDispatcher.addEventListener(StoneSupplyEvent.NO_STONE_OFFERED, handler);
			instance.eventDispatcher.addEventListener(StoneSupplyEvent.STONE_DILEMMA, handler);
			
			instance.castSurpriseEvent();
		}
		
	    private function check_surprise_event(e:StoneSupplyEvent):void {
	    	var transactionVO:StoneTransactionVO = e.transactionVO;
			if(e.type == StoneSupplyEvent.NO_STONE_OFFERED)
			{
				assertEquals("No stone offered", 0, transactionVO.quantity);
				assertEquals("No stone price", 0, transactionVO.price);
			}
		}
		
		private function fail_if_stone_offered_fired(e:StoneSupplyEvent):void {
			try {
            	assertTrue("this handler shouldn't have been called", false);
			}
			catch(assertionFailedError:AssertionFailedError) {
				getResult().addFailure(this, assertionFailedError);
			}
		}
		
		private function handle_stone_offered_fail(e:Event = null):void {
			// that's ok
		}
		
		
	}
}