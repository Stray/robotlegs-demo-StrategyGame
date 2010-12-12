package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.events.EventDispatcher;
	import strategy.controller.events.GameWonEvent;
	
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
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.ICalendarModel;

	public class ProcessGameWonCommandTest extends TestCase {
		private var instance:ProcessGameWonCommand;
        
		private const CASH:Number = 345;
		private const DAYS:uint = 4;

		public function ProcessGameWonCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICashModel, ICalendarModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ProcessGameWonCommand();
			instance.eventDispatcher = new EventDispatcher();
			instance.cashModel = nice(ICashModel);
			instance.calendarModel = nice(ICalendarModel);
			stub(instance.cashModel).property("currentValue").returns(CASH);
			stub(instance.calendarModel).property("currentValue").returns(DAYS);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ProcessGameWonCommand", instance is ProcessGameWonCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_dispatches_game_won_event_with_correct_values():void {
			var handler:Function = addAsync(check_execute_dispatches_game_won_event_with_correct_values, 50);
			instance.eventDispatcher.addEventListener(GameWonEvent.GAME_WON, handler);
			
			instance.execute();
		}

		private function check_execute_dispatches_game_won_event_with_correct_values(e:GameWonEvent):void {
			assertEquals('event is correct type', GameWonEvent.GAME_WON, e.type);
			assertEquals("cash set correctly", CASH, e.cashRemaining);
			assertEquals("days set correctly", DAYS, e.daysRemaining);
			
			
		}
		
	}
}