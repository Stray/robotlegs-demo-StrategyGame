package strategy.controller.commands.daycycle{

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.StoneStockCheckEvent;
	import strategy.controller.events.DayCycleEvent;
	import strategy.model.resources.IStoneSupplyModel;
	import flash.events.EventDispatcher;

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

	public class CheckStoneStockCommandTest extends TestCase {
		private var instance:CheckStoneStockCommand;
		private const STORAGE_CAPACITY:Number = 500;
		private const EXCESS_STONE:Number = 100;

		public function CheckStoneStockCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IStoneSupplyModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new CheckStoneStockCommand();         
			instance.stoneSupply = nice(IStoneSupplyModel);
			stub(instance.stoneSupply).property('max').returns(STORAGE_CAPACITY);
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CheckStoneStockCommand", instance is CheckStoneStockCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_triggers_stone_theft_if_overstocked():void {
			var handler:Function = addAsync(check_execute_triggers_stone_theft_if_overstocked, 50);
			instance.eventDispatcher.addEventListener(StoneStockCheckEvent.STOCK_STOLEN, handler);
			stub(instance.stoneSupply).property('currentValue').returns(STORAGE_CAPACITY + EXCESS_STONE);
			instance.execute();
		}

		private function check_execute_triggers_stone_theft_if_overstocked(e:StoneStockCheckEvent):void {
			trace("quantity stolen: " + e.quantity);
			assertTrue("quantity is within range", e.quantity <= EXCESS_STONE);
			verify(instance.stoneSupply).method("adjustByValue").args(equalTo(-e.quantity));
		}
		
		public function test_execute_triggers_stock_checked_if_not_overstocked():void {
			var handler:Function = addAsync(check_execute_triggers_stock_checked_if_not_overstocked, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.STONE_STOCK_CHECKED, handler);
			
			instance.execute();
		}

		private function check_execute_triggers_stock_checked_if_not_overstocked(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.STONE_STOCK_CHECKED, e.type);
		}
		
		
	}
}