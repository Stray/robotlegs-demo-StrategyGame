package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.DilemmaVOSupport;

	public class DilemmaViewMediatorTest extends TestCase {
		private var instanceMediator:DilemmaViewMediator;

		public function DilemmaViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new DilemmaViewMediator();
			instanceMediator.view = new DilemmaView(new DilemmaVOSupport());
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is DilemmaViewMediator", instanceMediator is DilemmaViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_optionSubmittedSignal_produces_correct_option_event():void {
			var handler:Function = addAsync(check_optionSubmittedSignal_produces_correct_option_event, 50);
			instanceMediator.eventDispatcher.addEventListener(OptionEvent.OPTION_3, handler);
			
			instanceMediator.view.optionSubmittedSignal.dispatch(3);
		}

		private function check_optionSubmittedSignal_produces_correct_option_event(e:OptionEvent):void {
			assertEquals('event is correct type', OptionEvent.OPTION_3, e.type);
			
		}
		
	}
}