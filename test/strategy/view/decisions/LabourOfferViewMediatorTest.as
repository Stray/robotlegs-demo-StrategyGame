package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.LabourSupplyEvent;

	public class LabourOfferViewMediatorTest extends TestCase {
		private var instanceMediator:LabourOfferViewMediator;

		public function LabourOfferViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new LabourOfferViewMediator();
			instanceMediator.view = new LabourOfferView(null);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is LabourOfferViewMediator", instanceMediator is LabourOfferViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_submit_signal_fires_no_workers_hired():void {
			var handler:Function = addAsync(check_submit_signal_fires_no_workers_hired, 50);
			instanceMediator.eventDispatcher.addEventListener(LabourSupplyEvent.NO_WORKERS_HIRED, handler);
			
			instanceMediator.view.submitSignal.dispatch();
		}

		private function check_submit_signal_fires_no_workers_hired(e:LabourSupplyEvent):void {
			assertEquals('event is correct type', LabourSupplyEvent.NO_WORKERS_HIRED, e.type);
			
		}
		
	}
}