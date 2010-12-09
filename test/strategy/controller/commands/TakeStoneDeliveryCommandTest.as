package strategy.controller.commands {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;
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
	import flash.events.EventDispatcher;
	import strategy.controller.events.DayCycleEvent;

	public class TakeStoneDeliveryCommandTest extends TestCase {
		private var instance:TakeStoneDeliveryCommand;
		
		private const QUANTITY:Number = 34;
		private const PRICE:Number = 23;

		public function TakeStoneDeliveryCommandTest(methodName:String=null) {
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
			instance = new TakeStoneDeliveryCommand(); 
			instance.eventDispatcher = new EventDispatcher();                                                           
			var transactionVO:StoneTransactionVO = new StoneTransactionVO(QUANTITY, PRICE);
			instance.stoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_PURCHASED, '', transactionVO);
			instance.cashModel = nice(ICashModel);
			instance.stoneSupplyModel = nice(IStoneSupplyModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is TakeStoneDeliveryCommand", instance is TakeStoneDeliveryCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function testExecute():void {
			assertTrue("Execute returns void", (instance.execute() == void));
		}
		
		public function test_execute_updates_cash():void {
		    instance.execute();
			var moneySpent:Number = -PRICE * QUANTITY;
			verify(instance.cashModel).method("adjustByValue").args(equalTo(moneySpent));
		}
		
		public function test_execute_updates_stone_supply():void {
			instance.execute();
			verify(instance.stoneSupplyModel).method("adjustByValue").args(equalTo(QUANTITY));
		}
		
		public function test_execute_fires_stone_delivery_completed_event():void {
			var handler:Function = addAsync(check_execute_fires_stone_delivery_completed_event, 50);
			instance.eventDispatcher.addEventListener(DayCycleEvent.STONE_DELIVERY_COMPLETED, handler);
			
			instance.execute();
		}

		private function check_execute_fires_stone_delivery_completed_event(e:DayCycleEvent):void {
			assertEquals('event is correct type', DayCycleEvent.STONE_DELIVERY_COMPLETED, e.type);
			
		}
		
		
	}
}