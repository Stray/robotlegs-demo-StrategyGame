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

	public class EnvironmentStatusViewMediatorTest extends TestCase {
		private var instanceMediator:EnvironmentStatusViewMediator;
        
		public function EnvironmentStatusViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(EnvironmentStatusView);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new EnvironmentStatusViewMediator();
			instanceMediator.view = nice(EnvironmentStatusView);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is EnvironmentStatusViewMediator", instanceMediator is EnvironmentStatusViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		} 
		
		public function test_environmentImpactUpdated_event_passed_to_view():void {
			var impact:Number = 85;
		    var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED, 0, impact);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method("updateStatus").args(equalTo(impact));
		}
		
		
	}
}