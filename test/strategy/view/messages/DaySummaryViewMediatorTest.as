package strategy.view.messages {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

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
			assertTrue("Failing test", false);
		}
		
	}
}