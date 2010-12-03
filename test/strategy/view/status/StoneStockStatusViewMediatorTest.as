package strategy.view.status {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.ResourceStatusEvent;

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
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.StoneStockStatusViewMediator;

	public class StoneStockStatusViewMediatorTest extends TestCase {
		private var instanceMediator:StoneStockStatusViewMediator;

		public function StoneStockStatusViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(StoneStockStatusView);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new StoneStockStatusViewMediator();
			instanceMediator.view = nice(StoneStockStatusView);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is StoneStockStatusViewMediator", instanceMediator is StoneStockStatusViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_update_event_updates_view():void { 
			var newValue:Number = 57;
			var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.STONE_SUPPLY_UPDATED, newValue, 0);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('updateStatus').args(equalTo(newValue));
		}
		
		public function test_update_capacity_updates_view():void {
			var newValue:Number = 600;
			var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.STONE_CAPACITY_UPDATED, newValue, 0);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('updateCapacity').args(equalTo(newValue));
		}
		
		
	}
}