package strategy.view {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

	public class SkyViewMediatorTest extends TestCase {
		private var skyViewMediator:SkyViewMediator;

		public function SkyViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			skyViewMediator = new SkyViewMediator();
			skyViewMediator.view = new SkyView();
			skyViewMediator.eventDispatcher = new EventDispatcher();
			skyViewMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			skyViewMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("skyViewMediator is SkyViewMediator", skyViewMediator is SkyViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("skyViewMediator is robotlegs Mediator", skyViewMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	}
}