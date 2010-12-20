package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.ILabourModel;

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

	public class SuspendWorkerCommandTest extends TestCase {
		private var instance:SuspendWorkerCommand;
		private const DAYS:uint = 3;

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		public function SuspendWorkerCommandTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SuspendWorkerCommand();
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withDays(DAYS).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig);
			instance.labour = nice(ILabourModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is SuspendWorkerCommand", instance is SuspendWorkerCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			instance.execute();
		    verify(instance.labour).method("suspendWorkerForDays").args(equalTo(DAYS));
		}
	}
}