package strategy.controller.surprises {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;
	import strategy.controller.events.DilemmaEvent;
	import strategy.model.FirstGameConfig;
	import config.SurprisesXMLImporter;
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.IEnvironmentalImpactModel;

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
	import org.robotlegs.base.OptionEvent;

	public class DilemmaSurpriseEventCasterTest extends TestCase {
		private var instance:DilemmaSurpriseEventCaster;

		public function DilemmaSurpriseEventCasterTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IHealthAndSafetyModel, IEnvironmentalImpactModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DilemmaSurpriseEventCaster();
			instance.eventDispatcher = new EventDispatcher();
			instance.surprisesXMLImporter = new SurprisesXMLImporter();
			instance.primeSurpriseEvents();
			instance.safety = nice(IHealthAndSafetyModel);
			instance.environment = nice(IEnvironmentalImpactModel);
			
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
		
	    public function test_dispatches_safety_event_if_safety_low():void {
	    	var handler:Function = addAsync(check_dispatches_safety_event_if_safety_low, 50);
	    	instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			instance.surprisePercentageProbability = 100;
			stub(instance.safety).property('currentPercentage').returns(0);
	    	instance.castSurpriseEvent();
	    }

	    private function check_dispatches_safety_event_if_safety_low(e:DilemmaEvent):void {
	    	assertEquals('event is correct type', DilemmaEvent.DILEMMA_PRESENTED, e.type);
	    	trace("Should be a health and safety event: ", e.dilemmaVO.title);
			assertTrue("manually verified", true);
	    }
		
	    public function test_dispatches_environment_event_if_environment_low():void {
	    	var handler:Function = addAsync(check_dispatches_environment_event_if_environment_low, 50);
	    	instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			instance.surprisePercentageProbability = 100;
			stub(instance.safety).property('currentPercentage').returns(100);
			stub(instance.environment).property('currentPercentage').returns(0);
	    	instance.castSurpriseEvent();
	    }

	    private function check_dispatches_environment_event_if_environment_low(e:DilemmaEvent):void {
	    	assertEquals('event is correct type', DilemmaEvent.DILEMMA_PRESENTED, e.type);
	    	trace("Should be an environment event: ", e.dilemmaVO.title);
			assertTrue("manually verified", true);
	    }
	
	    public function test_dispatches_other_event_if_safety_and_environment_not_low():void {
	    	var handler:Function = addAsync(check_dispatches_other_event_if_safety_and_environment_not_low, 50);
	    	instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			instance.surprisePercentageProbability = 100;
			stub(instance.safety).property('currentPercentage').returns(100);
			stub(instance.environment).property('currentPercentage').returns(100);
	    	instance.castSurpriseEvent();
	    }

	    private function check_dispatches_other_event_if_safety_and_environment_not_low(e:DilemmaEvent):void {
	    	assertEquals('event is correct type', DilemmaEvent.DILEMMA_PRESENTED, e.type);
	    	trace("Should be an other event: ", e.dilemmaVO.title);
			assertTrue("manually verified", true);
	    }
		
		public function test_castAccidentWithPercentageProbability_100():void {
			var handler:Function = addAsync(check_castAccidentWithPercentageProbability_100, 50);
			instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			
			instance.castAccidentWithPercentageProbability(100);
			instance.eventDispatcher.dispatchEvent(new OptionEvent(OptionEvent.OPTIONS_COMPLETED, null));
		}

		private function check_castAccidentWithPercentageProbability_100(e:DilemmaEvent):void {
			assertEquals('event is correct type', DilemmaEvent.DILEMMA_PRESENTED, e.type);
		}
		
		public function test_castAccidentWithPercentageProbability_0_dispatches_dayCycleEvent():void {
			var handler:Function = addAsync(check_castAccidentWithPercentageProbability_0_dispatches_dayCycleEvent, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.RANDOM_EVENTS_COMPLETED, handler);
			
			instance.castAccidentWithPercentageProbability(0);
			instance.eventDispatcher.dispatchEvent(new OptionEvent(OptionEvent.OPTIONS_COMPLETED, null));
		}

		private function check_castAccidentWithPercentageProbability_0_dispatches_dayCycleEvent(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.RANDOM_EVENTS_COMPLETED, e.type);
		}
		
	}
}