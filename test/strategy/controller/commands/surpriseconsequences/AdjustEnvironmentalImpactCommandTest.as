package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
    import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.IEnvironmentalImpactModel;

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

	public class AdjustEnvironmentalImpactCommandTest extends TestCase {
		private var instance:AdjustEnvironmentalImpactCommand;
		private const DAILY_ENVIRONMENT_CHANGE:Number = -1;
		private const ENVIRONMENT:Number = 50;

		public function AdjustEnvironmentalImpactCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IEnvironmentalImpactModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new AdjustEnvironmentalImpactCommand();
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withEnvironment(ENVIRONMENT).withDailyEnvironmentChange(DAILY_ENVIRONMENT_CHANGE).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig); 
			instance.environmentModel = nice(IEnvironmentalImpactModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is AdjustEnvironmentalImpactCommand", instance is AdjustEnvironmentalImpactCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			instance.execute();
			verify(instance.environmentModel).method("adjustByValue").arg(equalTo(ENVIRONMENT));
			verify(instance.environmentModel).setter("dailyImpact").arg(equalTo(DAILY_ENVIRONMENT_CHANGE));
		}
	}
}