package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.NullStoneTransactionVO;

	public class NoStoneViewMediatorTest extends TestCase {
		private var instanceMediator:NoStoneViewMediator;

		public function NoStoneViewMediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instanceMediator = new NoStoneViewMediator();
			instanceMediator.view = new NoStoneView('test message');
			instanceMediator.eventDispatcher = new EventDispatcher();
			instanceMediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instanceMediator = null;
		}

		public function testInstantiated():void {
			assertTrue("instanceMediator is NoStoneViewMediator", instanceMediator is NoStoneViewMediator);
		}
        
		public function testIsMediator():void{
			assertTrue("instanceMediator is robotlegs Mediator", instanceMediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	    public function test_submitSignal_from_view_fires_null_stone_purchase_event():void {
	    	var handler:Function = addAsync(check_submitSignal_from_view_fires_null_stone_purchase_event, 50);
	    	instanceMediator.eventDispatcher.addEventListener(StoneSupplyEvent.STONE_PURCHASED, handler);
	    	
	    	instanceMediator.view.submitSignal.dispatch();
	    }

	    private function check_submitSignal_from_view_fires_null_stone_purchase_event(e:StoneSupplyEvent):void {
	    	assertEquals('event is correct type', StoneSupplyEvent.STONE_PURCHASED, e.type);
			assertTrue("sends null VO", e.transactionVO is NullStoneTransactionVO);
	    }
		
	}
}