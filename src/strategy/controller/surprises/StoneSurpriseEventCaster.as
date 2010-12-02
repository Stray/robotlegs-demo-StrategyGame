package strategy.controller.surprises {
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	
	public class StoneSurpriseEventCaster extends Actor implements IStoneSurpriseEventCaster {
		
		protected var _possibleEvents:Vector.<StoneSupplyEvent>;
		
		protected var _surprisePercentageProbability:Number = 50;
		
		[Inject]
		public var stoneAvailabilityMarket:IStoneAvailabilityMarket;
		
		[Inject]
		public var stonePriceMarket:IStonePriceMarket;
		
		public function StoneSurpriseEventCaster() {
			
		}
		
		[PostConstruct]
		public function primeSurpriseEvents():void
		{
			if(_possibleEvents != null)
			{
				return;
			}         
			
			createSurpriseEvents();
		}
		
		//---------------------------------------
		// ISurpriseEventCaster Implementation
		//---------------------------------------
        
		public function set surprisePercentageProbability(value:Number):void
		{
			_surprisePercentageProbability = value;
		}

		public function castSurpriseEvent():void
		{
			if(_surprisePercentageProbability/100 > Math.random())
			{
				dispatchSurpriseEvent();
			}
			else
			{
				dispatchNormalEvent();
			}
		}
        
		//

		protected function dispatchNormalEvent():void
		{
			var stoneTransactionVO:StoneTransactionVO = new StoneTransactionVO(stoneAvailabilityMarket.currentValue, stonePriceMarket.currentValue);
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_OFFERED, "How much stone would you like to buy today?", stoneTransactionVO);
			dispatch(evt);
		}
		
		protected function dispatchSurpriseEvent():void
		{
			var eventIndex:uint = Math.floor(Math.random() * _possibleEvents.length);
			var chosenEvent:StoneSupplyEvent = _possibleEvents.splice(eventIndex, 1)[0];
			dispatch(chosenEvent);
		} 
		
		protected function createOneEvent(type:String, quantity:Number, price:Number, message:String):StoneSupplyEvent
		{
			var stoneTransactionVO:StoneTransactionVO = new StoneTransactionVO(quantity, price);
			return new StoneSupplyEvent(type, message, stoneTransactionVO);
		}
		
		protected function createSurpriseEvents():void
		{
			_possibleEvents = new Vector.<StoneSupplyEvent>();
			
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The depot have loaded stones that are too small.' ));
							
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The depot have loaded stones that are too big.' ));
		   
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The stone delivery wagon broke down.' ));
				                                                                              
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The stone delivery wagon got hijacked.' ));
			
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailabilityMarket.currentValue/4, stonePriceMarket.currentValue*2,
							   	'Another building project has just about cleaned out the stone merchant.' ));
							
			_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailabilityMarket.currentValue*2, stonePriceMarket.currentValue/3,
							   	'Another building project has fallen through - surplus stone is selling cheap.' ));
								
        	_possibleEvents.push( 
				createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailabilityMarket.currentValue*1.5, stonePriceMarket.currentValue/2,
							   	'The quarry took on some interns - stone is cheap and plentiful.' )); 

		}
		
	}
}