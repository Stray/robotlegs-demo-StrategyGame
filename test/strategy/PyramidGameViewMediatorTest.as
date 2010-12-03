package strategy {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

	public class PyramidGameViewMediatorTest extends TestCase {
		private var instanceMediator:PyramidGameViewMediator;

		public function PyramidGameViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new PyramidGameViewMediator();
			instanceMediator.view = new PyramidGameView();
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is PyramidGameViewMediator", instanceMediator is PyramidGameViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}