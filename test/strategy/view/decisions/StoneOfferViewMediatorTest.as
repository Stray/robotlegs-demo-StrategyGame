package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;

	public class StoneOfferViewMediatorTest extends TestCase {
		private var instanceMediator:StoneOfferViewMediator;
		private const QUANTITY:Number = 354;
		private const PRICE:Number = 205;
		

		public function StoneOfferViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new StoneOfferViewMediator();
			var availability:Number = 1000;
			instanceMediator.view = new StoneOfferView(PRICE, availability);
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is StoneOfferViewMediator", instanceMediator is StoneOfferViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test__submitSignal_dispatches_stone_purchase_event():void {
			var handler:Function = addAsync(check__submitSignal_dispatches_stone_purchase_event, 50);
			instanceMediator.eventDispatcher.addEventListener(StoneSupplyEvent.STONE_PURCHASED, handler);
			
			instanceMediator.view.submitSignal.dispatch(QUANTITY, PRICE);
		}

		private function check__submitSignal_dispatches_stone_purchase_event(e:StoneSupplyEvent):void {
			var transactionVO:StoneTransactionVO = e.transactionVO;
			assertEquals("quantity set correctly", QUANTITY, transactionVO.quantity);
			assertEquals("price set correctly", PRICE, transactionVO.price);
			
		}
		
		
	}
}