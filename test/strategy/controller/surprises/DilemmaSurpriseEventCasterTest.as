package strategy.controller.surprises {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;
	import strategy.controller.events.DilemmaEvent;
	import strategy.model.FirstGameConfig;
	import config.SurprisesXMLImporter;

	public class DilemmaSurpriseEventCasterTest extends TestCase {
		private var instance:DilemmaSurpriseEventCaster;

		public function DilemmaSurpriseEventCasterTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DilemmaSurpriseEventCaster();
			instance.eventDispatcher = new EventDispatcher();
			instance.surprisesXMLImporter = new SurprisesXMLImporter();
			instance.primeSurpriseEvents();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DilemmaSurpriseEventCaster", instance is DilemmaSurpriseEventCaster);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_cast_normal_event_dispatches_DayCycleEvent():void {
			var handler:Function = addAsync(check_cast_normal_event_dispatches_DayCycleEvent, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.RANDOM_EVENTS_COMPLETED, handler);
			
			instance.castNormalEvent();
		}

		private function check_cast_normal_event_dispatches_DayCycleEvent(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.RANDOM_EVENTS_COMPLETED, e.type);
		}
		
		public function test_cast_surprise_event_dispatches_dilemma_event_if_p1():void {
			var handler:Function = addAsync(check_cast_surprise_event_dispatches_dilemma_event_if_p1, 50);
			instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			instance.surprisePercentageProbability = 100;
			instance.castSurpriseEvent();
		}

		private function check_cast_surprise_event_dispatches_dilemma_event_if_p1(e:DilemmaEvent):void {
			assertEquals('event is correct type', DilemmaEvent.DILEMMA_PRESENTED, e.type);
			
		}
		
	}
}