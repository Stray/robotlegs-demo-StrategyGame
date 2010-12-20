package strategy.view {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

	public class PyramidProgressViewMediatorTest extends TestCase {
		private var instanceMediator:PyramidProgressViewMediator;

		public function PyramidProgressViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new PyramidProgressViewMediator();
			instanceMediator.view = new PyramidProgressView();
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is PyramidProgressViewMediator", instanceMediator is PyramidProgressViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}