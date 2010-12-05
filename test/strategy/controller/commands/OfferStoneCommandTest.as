package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.events.EventDispatcher;
	import strategy.controller.surprises.IStoneSurpriseEventCaster;
	import strategy.model.resources.ICalendarModel;

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
	import strategy.model.FirstGameConfig;

	public class OfferStoneCommandTest extends TestCase {
		private var instance:OfferStoneCommand;

		public function OfferStoneCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICalendarModel, IStoneSurpriseEventCaster);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new OfferStoneCommand();
			instance.config = new FirstGameConfig();
			instance.calendarModel = nice(ICalendarModel);
			instance.stoneSurpriseEventCaster = nice(IStoneSurpriseEventCaster);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is OfferStoneCommand", instance is OfferStoneCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			assertTrue("Execute returns void", (instance.execute() == void));
		}
		
		public function test_requestsNormalEvent_if_days_under_normal_config_days():void {
			stub(instance.calendarModel).property("daysPassed").returns(2);
			instance.execute();
			verify(instance.stoneSurpriseEventCaster).method('castNormalEvent').noArgs();
		}
				
		public function test_requestsSurpriseEvent_if_days_over_config_normal_days():void {
			stub(instance.calendarModel).property("daysPassed").returns(4);
			instance.execute();
			verify(instance.stoneSurpriseEventCaster).method('castSurpriseEvent').noArgs();
		}
		
		
	}
}