package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
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
	import strategy.controller.events.DayCycleEvent;
	import flash.events.EventDispatcher;

	public class RestTheWeekendCommandTest extends TestCase {
		private var instance:RestTheWeekendCommand;

		public function RestTheWeekendCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourModel, ICalendarModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new RestTheWeekendCommand();
			instance.labourModel = nice(ILabourModel);
			instance.calendarModel = nice(ICalendarModel);
			instance.config = new FirstGameConfig();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is RestTheWeekendCommand", instance is RestTheWeekendCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_adjustEnergyLevel():void {
			instance.execute();
			verify(instance.labourModel).method("adjustTeamEnergy").args(equalTo(10));
		}
		
		public function test_execute_adjustsCalendar():void {
			instance.execute();
			verify(instance.calendarModel).method("adjustByValue").args(equalTo(-2)); 
		} 
		
		public function test_execute_dispatches_dayEnded():void {
			var handler:Function = addAsync(check_execute_dispatches_dayEnded, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.DAY_ENDED, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_dayEnded(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.DAY_ENDED, e.type);
		}
		
	}
}