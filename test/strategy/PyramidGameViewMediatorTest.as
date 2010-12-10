package strategy {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
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
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.events.DailyProgressEvent;
	import strategy.model.transactions.DailyProductivityVO;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.controller.events.StoneStockCheckEvent;

	public class PyramidGameViewMediatorTest extends TestCase {
		private var instanceMediator:PyramidGameViewMediator;

		public function PyramidGameViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(PyramidGameView);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new PyramidGameViewMediator();
			instanceMediator.view = nice(PyramidGameView);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is PyramidGameViewMediator", instanceMediator is PyramidGameViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
 		public function test_stoneOffered_passes_values_to_view():void {                   
			var quantity:Number = 523;
			var price:Number = 23;
			var transactionVO:StoneTransactionVO = new StoneTransactionVO(quantity, price);
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_OFFERED, '', transactionVO);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('showStoneOffer').args(equalTo(price), equalTo(quantity));
		} 
		
		public function test_stoneDilemma_passes_values_to_view():void {                   
			var quantity:Number = 523;
			var price:Number = 23;
			var message:String = "test message";
			var transactionVO:StoneTransactionVO = new StoneTransactionVO(quantity, price);
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_DILEMMA, message, transactionVO);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('showStoneDilemma').args(equalTo(price), equalTo(quantity), equalTo(message));
		}
		
		public function test_noStoneOffered_passes_values_to_view():void {                   
			var message:String = "test message";
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.NO_STONE_OFFERED, message, null);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('showNoStoneOffer').args(equalTo(message));
		}
		
		public function test_stoneDeliveryCompleted_removes_stone_offer_from_view():void {
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.STONE_DELIVERY_COMPLETED);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('removeStoneOffer').noArgs();
		}
		
		public function test_daySummary_passes_values_to_view():void {
			var blocksBuilt:Number = 352;
			var wagesPaid:Number = 345;
			var productivityVO:DailyProductivityVO = new DailyProductivityVO(blocksBuilt, wagesPaid);
			var evt:DailyProgressEvent = new DailyProgressEvent(DailyProgressEvent.PROGRESS_CALCULATED, productivityVO);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method("showEndOfDaySummary").args(equalTo(blocksBuilt), equalTo(wagesPaid));
		}
		
		public function test_dayEnded_removes_daySummary_from_view():void {
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.DAY_ENDED);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('removeEndOfDaySummary').noArgs();
		}
		
		public function test_workersOffered_passes_values_to_view():void {
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			var evt:LabourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.WORKERS_OFFERED, workers);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method("showLabourOffer").args(equalTo(workers));
		}

		public function test_labourHireCompleted_removes_daySummary_from_view():void {
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.LABOUR_HIRE_COMPLETED);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('removeLabourOffer').noArgs();
		}
		
		public function test_stockStolen_passes_values_to_view():void {                   
			var quantity:Number = 523;
			var evt:StoneStockCheckEvent = new StoneStockCheckEvent(StoneStockCheckEvent.STOCK_STOLEN , quantity);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('showStoneStockCheck').args(equalTo(quantity));
		}
		
		public function test_stockCheckCompleted_removes_stoneStockCheck_from_view():void {
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.STONE_STOCK_CHECKED);
			instanceMediator.eventDispatcher.dispatchEvent(evt);
			verify(instanceMediator.view).method('removeStoneStockCheck').noArgs();
		}
		
	}
}