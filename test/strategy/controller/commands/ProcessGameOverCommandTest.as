package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import flash.events.EventDispatcher;
	import strategy.controller.events.GameOverEvent;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ICashModel;

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
	import strategy.view.messages.GameMessageText;
	import strategy.view.messages.IGameMessageText;

	public class ProcessGameOverCommandTest extends TestCase {
		private var instance:ProcessGameOverCommand;

		public function ProcessGameOverCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICalendarModel, ICashModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ProcessGameOverCommand();
			instance.eventDispatcher = new EventDispatcher();
			instance.calendarModel = nice(ICalendarModel);
			instance.cashModel = nice(ICashModel);
			instance.gameMessageText = new GameMessageText();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ProcessGameOverCommand", instance is ProcessGameOverCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_fires_gameOver_with_correct_fail_message_calendar_only():void {
			var handler:Function = addAsync(check_execute_fires_gameOver_with_correct_fail_message_calendar_only, 50);
			instance.eventDispatcher.addEventListener(GameOverEvent.GAME_OVER, handler);
			stub(instance.calendarModel).property("currentValue").returns(0);
			stub(instance.cashModel).property("currentValue").returns(10);
			instance.execute();
		}

		private function check_execute_fires_gameOver_with_correct_fail_message_calendar_only(e:GameOverEvent):void {
			assertEquals("calendar message", instance.gameMessageText.calendarFailMessage, e.reason);
		}
		
		public function test_execute_fires_gameOver_with_correct_fail_message_cash_only():void {
			var handler:Function = addAsync(check_execute_fires_gameOver_with_correct_fail_message_cash_only, 50);
			instance.eventDispatcher.addEventListener(GameOverEvent.GAME_OVER, handler);
			stub(instance.calendarModel).property("currentValue").returns(10);
			stub(instance.cashModel).property("currentValue").returns(0);
			instance.execute();
		}

		private function check_execute_fires_gameOver_with_correct_fail_message_cash_only(e:GameOverEvent):void {
			assertEquals("calendar message", instance.gameMessageText.cashFailMessage, e.reason);
		}
		
		public function test_execute_fires_gameOver_with_correct_fail_message_cash_and_calendar():void {
			var handler:Function = addAsync(check_execute_fires_gameOver_with_correct_fail_message_cash_and_calendar, 50);
			instance.eventDispatcher.addEventListener(GameOverEvent.GAME_OVER, handler);
			stub(instance.calendarModel).property("currentValue").returns(0);
			stub(instance.cashModel).property("currentValue").returns(-1);
			instance.execute();
		}

		private function check_execute_fires_gameOver_with_correct_fail_message_cash_and_calendar(e:GameOverEvent):void {
			assertEquals("calendar message", instance.gameMessageText.cashAndCalendarFailMessage, e.reason);
		}
	}
}