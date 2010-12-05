package strategy.view.decisions {
	
	import strategy.view.decisions.StoneOfferView;
	
	import org.robotlegs.mvcs.SignalMediator;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;
	
	public class StoneOfferViewMediator extends SignalMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:StoneOfferView;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function StoneOfferViewMediator() {			
			// Try not to put stuff in the constructor of the mediator
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			addToSignal(view.submitSignal, submitHandler);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		protected function submitHandler(quantity:Number, price:Number):void
		{
			var transactionVO:StoneTransactionVO = new StoneTransactionVO(quantity, price);
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_PURCHASED, "Stone purchased", transactionVO);
			dispatch(evt);
		}
	}
}