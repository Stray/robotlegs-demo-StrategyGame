package strategy.view.logs {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

	public class LineGraphMediatorTest extends TestCase {
		private var lineGraphMediator:LineGraphMediator;

		public function LineGraphMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			lineGraphMediator = new LineGraphMediator();
			lineGraphMediator.view = new LineGraph();
			lineGraphMediator.eventDispatcher = new EventDispatcher();
			lineGraphMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			lineGraphMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("lineGraphMediator is LineGraphMediator", lineGraphMediator is LineGraphMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("lineGraphMediator is robotlegs Mediator", lineGraphMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}