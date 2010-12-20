package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICashModel;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;

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
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;

	public class SpendMoneyCommandTest extends TestCase {
		private var instance:SpendMoneyCommand;
		private const CASH:Number = -999;

		public function SpendMoneyCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICashModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SpendMoneyCommand();
			instance.cash = nice(ICashModel);                                     
			var payload:DilemmaConfig = new DilemmaConfigBuilder().withCash(CASH).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_10, payload);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is SpendMoneyCommand", instance is SpendMoneyCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute_spends_money():void {
			instance.execute();
			verify(instance.cash).method('adjustByValue').args(equalTo(CASH));
		}
	}
}