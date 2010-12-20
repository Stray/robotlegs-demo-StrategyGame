package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.ResourceStatusEvent;
	import flash.events.EventDispatcher;
	import strategy.controller.events.ResourceBoundaryEvent;

	public class BuildingProgressModelTest extends TestCase {
		private var instance:BuildingProgressModel;
		private const NEW_VALUE:Number = 50;
		private const NEW_PERCENTAGE:Number = 30;

		public function BuildingProgressModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new BuildingProgressModel();
			instance.eventDispatcher = new EventDispatcher();
			
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is BuildingProgressModel", instance is BuildingProgressModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_set_currentValue_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentValue_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, handler);
			
			instance.currentValue = NEW_VALUE;
		}

		private function check_set_currentValue_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, e.type);
			assertEquals('value is correct', NEW_VALUE, e.value);
			assertEquals('percentage is correct', instance.currentPercentage, e.percentage);
		}
		
		public function test_set_currentPercentage_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentPercentage_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, handler);
			
			instance.currentPercentage = NEW_PERCENTAGE;
		}

		private function check_set_currentPercentage_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, e.type);
			assertEquals('value is correct', instance.currentValue, e.value);
			assertEquals('percentage is correct', NEW_PERCENTAGE, e.percentage);
		}
		
		public function test_incrementing_to_reach_the_max_value_dispatches_target_reached():void {
			var handler:Function = addAsync(check_incrementing_to_reach_the_max_value_dispatches_target_reached, 50);
			instance.eventDispatcher.addEventListener(ResourceBoundaryEvent.TARGET_REACHED, handler);
			instance.currentPercentage = 95;
			instance.adjustByPercentage(5);
		}

		private function check_incrementing_to_reach_the_max_value_dispatches_target_reached(e:ResourceBoundaryEvent):void {
			assertEquals('event is correct type', ResourceBoundaryEvent.TARGET_REACHED, e.type);
		}
		
		public function test_changing_max_dispatches_update_event():void {
			instance.currentPercentage = 60;
			var handler:Function = addAsync(check_changing_max_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, handler);
			instance.max = instance.max*2;
		}

		private function check_changing_max_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.BUILDING_PROGRESS_UPDATED, e.type);
			assertEquals("percentage is half what it was before target doubled", 30, e.percentage);
		}
		
		
	}
}