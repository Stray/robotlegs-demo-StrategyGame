package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.ResourceBoundaryEvent;
	import flash.events.EventDispatcher;

	public class CashModelTest extends TestCase {
		private var instance:CashModel;
        private const NEW_VALUE:Number = 20;
		private const NEW_PERCENTAGE:Number = 30;

		public function CashModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new CashModel();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CashModel", instance is CashModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_set_currentValue_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentValue_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.CASH_UPDATED, handler);
			
			instance.currentValue = NEW_VALUE;
		}

		private function check_set_currentValue_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.CASH_UPDATED, e.type);
			assertEquals('value is correct', NEW_VALUE, e.value);
			assertEquals('percentage is correct', instance.currentPercentage, e.percentage);
		}
		
		public function test_set_currentPercentage_dispatches_update_event():void {
			var handler:Function = addAsync(check_set_currentPercentage_dispatches_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.CASH_UPDATED, handler);
			
			instance.currentPercentage = NEW_PERCENTAGE;
		}

		private function check_set_currentPercentage_dispatches_update_event(e:ResourceStatusEvent):void {
			assertEquals('event is correct type', ResourceStatusEvent.CASH_UPDATED, e.type);
			assertEquals('value is correct', instance.currentValue, e.value);
			assertEquals('percentage is correct', NEW_PERCENTAGE, e.percentage);
		}
		
		public function test_reducing_to_the_minimum_dispatches_boundary_breached_event():void {
			var handler:Function = addAsync(check_reducing_to_the_minimum_dispatches_boundary_breached_event, 50);
			instance.eventDispatcher.addEventListener(ResourceBoundaryEvent.BOUNDARY_BREACHED, handler);
			
			instance.currentValue = 10;
			instance.currentValue = 1;
			instance.adjustByValue(-1);
		}

		private function check_reducing_to_the_minimum_dispatches_boundary_breached_event(e:ResourceBoundaryEvent):void {
			assertEquals('event is correct type', ResourceBoundaryEvent.BOUNDARY_BREACHED, e.type);
		}
		
	}
}