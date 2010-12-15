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

	public class SafetyStatusViewMediatorTest extends TestCase {
		private var instanceMediator:SafetyStatusViewMediator;

		public function SafetyStatusViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(SafetyStatusView);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new SafetyStatusViewMediator();
			instanceMediator.view = nice(SafetyStatusView);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is SafetyStatusViewMediator", instanceMediator is SafetyStatusViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_environmentImpactUpdated_event_passed_to_view():void {
			var safety:Number = 85;
		    var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED , 0, safety);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method("updateStatus").args(equalTo(safety));
		}
		
	}
}