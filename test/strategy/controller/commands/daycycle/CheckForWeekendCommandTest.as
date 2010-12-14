package strategy.controller.commands.daycycle {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;
	import strategy.model.FirstGameConfig;
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
	
	public class CheckForWeekendCommandTest extends TestCase {
		private var instance:CheckForWeekendCommand;

		public function CheckForWeekendCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICalendarModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new CheckForWeekendCommand();
			instance.eventDispatcher = new EventDispatcher();
			instance.config = new FirstGameConfig();
			instance.calendarModel = nice(ICalendarModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CheckForWeekendCommand", instance is CheckForWeekendCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(3);
			instance.execute();
		}

		private function check_execute_dispatches_workingDayStarted_when_not_weekend(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.WORKING_DAY_STARTED, e.type);
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_3rd_week():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(16);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_monday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(1);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_tuesday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(2);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_wednesday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(10);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_thursday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(11);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_saturday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(20);
			instance.execute();
		}
		
		public function test_execute_dispatches_workingDayStarted_when_not_weekend_for_sunday():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_when_not_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			stub(instance.calendarModel).property('daysPassed').returns(21);
			instance.execute();
		}

		public function test_execute_dispatches_weekendDayStarted_when_friday():void {
			var handler:Function = addAsync(check_execute_dispatches_weekendDayStarted_when_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WEEKEND_DAY_STARTED, handler); 
			stub(instance.calendarModel).property('daysPassed').returns(5);
			instance.execute();
		}

		private function check_execute_dispatches_weekendDayStarted_when_weekend(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.WEEKEND_DAY_STARTED, e.type);
		}
		
		public function test_execute_dispatches_weekendDayStarted_when_weekend_2():void {
			var handler:Function = addAsync(check_execute_dispatches_weekendDayStarted_when_weekend, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WEEKEND_DAY_STARTED, handler); 
			stub(instance.calendarModel).property('daysPassed').returns(19);
			instance.execute();
		}
		
	}
}