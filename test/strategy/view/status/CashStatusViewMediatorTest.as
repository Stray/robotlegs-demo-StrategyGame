package strategy.view.status {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

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
	import strategy.controller.events.ResourceStatusEvent;

	public class CashStatusViewMediatorTest extends TestCase {
		private var instanceMediator:CashStatusViewMediator;

		public function CashStatusViewMediatorTest(methodName:String=null) {
			super(methodName)
		}
                                                            
		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(CashStatusView);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new CashStatusViewMediator();
			instanceMediator.view = nice(CashStatusView);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is CashStatusViewMediator", instanceMediator is CashStatusViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_update_event_updates_view():void { 
			var newValue:Number = 57;
			var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.CASH_UPDATED, newValue, 0);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('updateStatus').args(equalTo(newValue));
		}
		
	}
}