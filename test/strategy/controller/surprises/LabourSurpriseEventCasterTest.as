package strategy.controller.surprises {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	import asunit.errors.AssertionFailedError;
	import strategy.model.markets.LabourAvailabilityMarket;
	import flash.events.Event;
	import strategy.model.markets.LabourPriceMarket;
	import flash.events.EventDispatcher;
	import strategy.model.FirstGameConfig;

	public class LabourSurpriseEventCasterTest extends TestCase {
		private var instance:LabourSurpriseEventCaster;
		private const MAXIMUM_WORKERS_OFFERED:uint = 3;

		public function LabourSurpriseEventCasterTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourSurpriseEventCaster();
			instance.eventDispatcher = new EventDispatcher();
			instance.labourAvailabilityMarket = new LabourAvailabilityMarket();
			instance.labourAvailabilityMarket.max = MAXIMUM_WORKERS_OFFERED;
			instance.labourPriceMarket = new LabourPriceMarket();
			instance.config = new FirstGameConfig();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourSurpriseEventCaster", instance is LabourSurpriseEventCaster);
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
			instance.eventDispatcher.addEventListener(LabourSupplyEvent.NO_WORKERS_OFFERED, handler);
			
			instance.castSurpriseEvent();
		}

		private function check_castSurpriseEvent_fires_all_normal_events_for_p_0(e:LabourSupplyEvent):void {
			assertEquals('event is correct type', LabourSupplyEvent.NO_WORKERS_OFFERED, e.type);
			assertTrue("no workers offered", e.workers == null)
		}
		
		public function test_castSurpriseEvent_fires_all_special_events_for_p_1():void {
			instance.surprisePercentageProbability = 100;
			
			var failHandler:Function = addAsync(fail_if_no_workers_offered_fired, 50, handle_workers_offered_fail);
			instance.eventDispatcher.addEventListener(LabourSupplyEvent.NO_WORKERS_OFFERED, failHandler);
			
			var handler:Function = addAsync(check_surprise_event, 50);
			instance.eventDispatcher.addEventListener(LabourSupplyEvent.WORKERS_OFFERED, handler);
			
			instance.castSurpriseEvent();
		}
		
	    private function check_surprise_event(e:LabourSupplyEvent):void {
	    	var workers:Vector.<WorkerProductivityVO> = e.workers;
			assertTrue("hasn't offered more than the max number of workers", workers.length <= MAXIMUM_WORKERS_OFFERED);
			trace(workers);
		}
		
		private function fail_if_no_workers_offered_fired(e:LabourSupplyEvent):void {
			try {
            	assertTrue("this handler shouldn't have been called", false);
			}
			catch(assertionFailedError:AssertionFailedError) {
				getResult().addFailure(this, assertionFailedError);
			}
		}
		
		private function handle_workers_offered_fail(e:Event = null):void {
			// that's ok
		}
	}
}