package strategy.controller.commands.daycycle {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DilemmaEvent;

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
	import org.robotlegs.core.IOptionCommandMap;
	import flash.events.EventDispatcher;
	import strategy.model.gameplay.dilemmas.WeekendWorkingDilemma;
	import strategy.controller.commands.surpriseconsequences.WorkTheWeekendCommand;
	import strategy.controller.commands.surpriseconsequences.RestTheWeekendCommand;
	import org.robotlegs.mvcs.OptionCommandMapper;

	public class OfferWeekendWorkingCommandTest extends TestCase {
		private var instance:OfferWeekendWorkingCommand;

		public function OfferWeekendWorkingCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IOptionCommandMap);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new OfferWeekendWorkingCommand();
			instance.optionCommandMapper = new OptionCommandMapper();
			instance.optionCommandMapper.optionCommandMap = nice(IOptionCommandMap);
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is OfferWeekendWorkingCommand", instance is OfferWeekendWorkingCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_dispatches_dilemma_event():void {
			var handler:Function = addAsync(check_execute_dispatches_dilemma_event, 50);
			instance.eventDispatcher.addEventListener(DilemmaEvent.DILEMMA_PRESENTED, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_dilemma_event(e:DilemmaEvent):void {
			assertTrue("Contains weekend dilemmaVO", e.dilemmaVO is WeekendWorkingDilemma);
		}
		
		public function test_execute_mapsOptionConsequences_on_optionCommandMap():void {
			instance.execute();
			verify(instance.optionCommandMapper.optionCommandMap).method('mapOption').args(equalTo(1), equalTo(WorkTheWeekendCommand));
			verify(instance.optionCommandMapper.optionCommandMap).method('mapOption').args(equalTo(2), equalTo(RestTheWeekendCommand));
		}
		
	}
}