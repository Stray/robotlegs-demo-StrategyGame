package strategy.controller.commands.surpriseconsequences {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.IStoneSupplyModel;

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
	import strategy.model.gameplay.dilemmas.DilemmaConfig;

	public class DoubleStoneStorageCommandTest extends TestCase {
		private var instance:DoubleStoneStorageCommand;
		private const CASH:Number = 345;
		private const CAPACITY:Number = 476;

		public function DoubleStoneStorageCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ICashModel, IStoneSupplyModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DoubleStoneStorageCommand();
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withCash(CASH).withStoneCapacity(CAPACITY).build();
			instance.optionEvent = new OptionEvent(OptionEvent.OPTION_1, dilemmaConfig);
			instance.cash = nice(ICashModel);
			instance.stoneStock = nice(IStoneSupplyModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DoubleStoneStorageCommand", instance is DoubleStoneStorageCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_adjusts_cash_correctly():void {
			instance.execute();
			verify(instance.cash).method("adjustByValue").args(equalTo(CASH));
		}
		
		public function test_execute_adjusts_stoneStock_correctly():void {
			instance.execute();
			verify(instance.stoneStock).setter("max").args(equalTo(CAPACITY));
		}
		
		
	}
}