package strategy.controller.commands.daycycle{

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.surprises.ILabourSurpriseEventCaster;

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
	import strategy.model.resources.ICalendarModel;

	public class OfferLabourCommandTest extends TestCase {
		private var instance:OfferLabourCommand;

		public function OfferLabourCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourSurpriseEventCaster, ICalendarModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new OfferLabourCommand();
			instance.config = new FirstGameConfig();
			instance.labourSurpriseEventCaster = nice(ILabourSurpriseEventCaster);
			instance.calendarModel = nice(ICalendarModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is OfferLabourCommand", instance is OfferLabourCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_requestsNormalEvent_if_days_under_normal_config_days():void {
			stub(instance.calendarModel).property("daysPassed").returns(2);
			instance.execute();
			verify(instance.labourSurpriseEventCaster).method('castNormalEvent').noArgs();
		}
				
		public function test_requestsSurpriseEvent_if_days_over_config_normal_days():void {
			stub(instance.calendarModel).property("daysPassed").returns(4);
			instance.execute();
			verify(instance.labourSurpriseEventCaster).method('castSurpriseEvent').noArgs();
		}
	}
}