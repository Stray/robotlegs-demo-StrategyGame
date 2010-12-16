package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.IWorker;

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
	import flash.events.EventDispatcher;
	import strategy.controller.events.DayCycleEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;

	public class WorkTheWeekendCommandTest extends TestCase {
		private var instance:WorkTheWeekendCommand;
		private const PRODUCTIVITY:Number = -10;

		public function WorkTheWeekendCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourModel, IWorker);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new WorkTheWeekendCommand();
			instance.labourModel = nice(ILabourModel);
			instance.eventDispatcher = new EventDispatcher();

			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withProductivity(PRODUCTIVITY).build();
			var evt:OptionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig);
			instance.optionEvent = evt;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is WorkTheWeekendCommand", instance is WorkTheWeekendCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_adjusts_energy_levels():void {
			instance.execute();
		    verify(instance.labourModel).method('adjustTeamEnergy').args(equalTo(PRODUCTIVITY));
		}
		
		public function test_execute_dispatches_workingDayStarted_event():void {
			var handler:Function = addAsync(check_execute_dispatches_workingDayStarted_event, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.WORKING_DAY_STARTED, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_workingDayStarted_event(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.WORKING_DAY_STARTED, e.type);
		}
	}
}