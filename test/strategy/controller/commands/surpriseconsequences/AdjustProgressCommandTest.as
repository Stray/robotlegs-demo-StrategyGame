package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.IBuildingProgressModel;

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

	public class AdjustProgressCommandTest extends TestCase {
		private var instance:AdjustProgressCommand;
		private const PROGRESS:Number = -250;

		public function AdjustProgressCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IBuildingProgressModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new AdjustProgressCommand();
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withProgress(PROGRESS).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig); 
			instance.progress = nice(IBuildingProgressModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is AdjustProgressCommand", instance is AdjustProgressCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			instance.execute();
			verify(instance.progress).method("adjustByValue").args(equalTo(PROGRESS));
		}
	}
}