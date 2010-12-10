package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.DayCycleEvent;

	public class DaySummaryViewMediatorTest extends TestCase {
		private var instanceMediator:DaySummaryViewMediator;

		public function DaySummaryViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new DaySummaryViewMediator();
			instanceMediator.view = new DaySummaryView(100, 100);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is DaySummaryViewMediator", instanceMediator is DaySummaryViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_dispatches_dayEnded_when_view_submit_fires():void {
			var handler:Function = addAsync(check_dispatches_dayEnded_when_view_submit_fires, 50);
			instanceMediator.eventDispatcher.addEventListener(DayCycleEvent.DAY_ENDED, handler);
			instanceMediator.view.submitSignal.dispatch();
		}

		private function check_dispatches_dayEnded_when_view_submit_fires(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.DAY_ENDED, e.type);
		}
		
	}
}