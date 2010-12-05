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
		
		
	}
}