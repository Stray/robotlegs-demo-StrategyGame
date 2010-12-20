package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import org.robotlegs.base.OptionEvent;

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
	import strategy.model.resources.IHealthAndSafetyModel;

	public class AdjustSafetyCommandTest extends TestCase {
		private var instance:AdjustSafetyCommand;
		private const DAILY_SAFETY_CHANGE:Number = 1;
		private const SAFETY:Number = 90;

		public function AdjustSafetyCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IHealthAndSafetyModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new AdjustSafetyCommand();
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withDailySafetyChange(DAILY_SAFETY_CHANGE).withSafety(SAFETY).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig); 
			instance.safety = nice(IHealthAndSafetyModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is AdjustSafetyCommand", instance is AdjustSafetyCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			instance.execute();
			verify(instance.safety).method("adjustByValue").args(equalTo(SAFETY));
			verify(instance.safety).setter("dailyImpact").arg(equalTo(DAILY_SAFETY_CHANGE));
		}
	}
}