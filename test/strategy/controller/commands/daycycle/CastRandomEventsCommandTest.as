package strategy.controller.commands.daycycle {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
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

	public class CastRandomEventsCommandTest extends TestCase {
		private var instance:CastRandomEventsCommand;

		public function CastRandomEventsCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICalendarModel, IDilemmaSurpriseEventCaster);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new CastRandomEventsCommand();
			instance.dilemmaSurpriseEventCaster = nice(IDilemmaSurpriseEventCaster);
			instance.config = new FirstGameConfig();
			instance.calendarModel = nice(ICalendarModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CastRandomEventsCommand", instance is CastRandomEventsCommand);
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
			verify(instance.dilemmaSurpriseEventCaster).method('castNormalEvent').noArgs();
		}
				
		public function test_requestsSurpriseEvent_if_days_over_config_normal_days():void {
			stub(instance.calendarModel).property("daysPassed").returns(4);
			instance.execute();
			verify(instance.dilemmaSurpriseEventCaster).method('castSurpriseEvent').noArgs();
		}
	}
}