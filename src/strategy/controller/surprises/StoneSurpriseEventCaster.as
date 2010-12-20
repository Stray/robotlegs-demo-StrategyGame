package strategy.controller.surprises {
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.transactions.StoneTransactionVO;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	import strategy.controller.surprises.BaseSurpriseEventCaster;
	
	public class StoneSurpriseEventCaster extends BaseSurpriseEventCaster implements IStoneSurpriseEventCaster {
		
		protected var _possibleEvents:Vector.<StoneSupplyEvent>;
				
		[Inject]
		public var stoneAvailabilityMarket:IStoneAvailabilityMarket;
		
		[Inject]
		public var stonePriceMarket:IStonePriceMarket;
		
		public function StoneSurpriseEventCaster() {
			_surprisePercentageProbability = 20;
		}
		
		override public function primeSurpriseEvents():void
		{
			if(_possibleEvents != null)
			{
				return;
			}         
			createSurpriseEvents();
		}
		
		override protected function dispatchNormalEvent():void
		{
			var stoneTransactionVO:StoneTransactionVO = new StoneTransactionVO(stoneAvailabilityMarket.currentValue, stonePriceMarket.currentValue);
			var evt:StoneSupplyEvent = new StoneSupplyEvent(StoneSupplyEvent.STONE_OFFERED, "How much stone would you like to buy today?", stoneTransactionVO);
			dispatch(evt);
		}
		
		override protected function dispatchSurpriseEvent():void
		{
			if(_possibleEvents.length == 0)
			{
				dispatchNormalEvent();
			}
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
			var stoneAvailability:Number = stoneAvailabilityMarket.currentValue;
			var stonePrice:Number = stonePriceMarket.currentValue;

			_possibleEvents = new Vector.<StoneSupplyEvent>();
			
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The quarry have loaded stones that are too small.' ));
							
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The quarry have loaded stones that are too big.' ));
		   
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The stone delivery wagon broke down.' ));
				                                                                              
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.NO_STONE_OFFERED, 0, 0,
							   	'Oops! The stone delivery wagon got hijacked.' ));
			
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailability/4, stonePrice*2,
							   	'Another building project has just about cleaned out the stone merchant.' ));
							
			_possibleEvents.push( createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailability*2, stonePrice/3,
							   	'Another building project has fallen through - surplus stone is selling cheap.' ));
								
        	_possibleEvents.push( createOneEvent(StoneSupplyEvent.STONE_DILEMMA, stoneAvailability*1.5, stonePrice/2,
							   	'The quarry took on some interns - stone is cheap and plentiful.' )); 
		}
	}
}