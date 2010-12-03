package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import flash.events.EventDispatcher;
	import strategy.controller.events.ResourceStatusEvent;

	public class StoneSupplyModelTest extends TestCase {
		private var instance:StoneSupplyModel;
        private const NEW_VALUE:Number = 20;
		private const NEW_PERCENTAGE:Number = 30;
		private const NEW_MAX:Number = 400;

		public function StoneSupplyModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneSupplyModel();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneSupplyModel", instance is StoneSupplyModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_set_currentValue_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentValue_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.STONE_SUPPLY_UPDATED, handler);
			
			instance.currentValue = NEW_VALUE;
		}

		private function check_set_currentValue_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.STONE_SUPPLY_UPDATED, e.type);
			assertEquals('value is correct', NEW_VALUE, e.value);
			assertEquals('percentage is correct', instance.currentPercentage, e.percentage);
		}
		
		public function test_set_currentPercentage_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentPercentage_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.STONE_SUPPLY_UPDATED, handler);
			
			instance.currentPercentage = NEW_PERCENTAGE;
		}

		private function check_set_currentPercentage_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.STONE_SUPPLY_UPDATED, e.type);
			assertEquals('value is correct', instance.currentValue, e.value);
			assertEquals('percentage is correct', NEW_PERCENTAGE, e.percentage);
		}
		
		public function test_set_max_dispatches_update_capacity_event():void {
			var handler:Function = addAsync(check_set_max_dispatches_update_capacity_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.STONE_CAPACITY_UPDATED, handler);
			
			instance.max = NEW_MAX;
		}

		private function check_set_max_dispatches_update_capacity_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.STONE_CAPACITY_UPDATED, e.type);
			assertEquals('value is correct', NEW_MAX, e.value);
		}
		
	}
}