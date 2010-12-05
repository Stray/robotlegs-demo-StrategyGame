package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.markets.IStoneAvailabilityMarket;
	import strategy.model.markets.IStonePriceMarket;
	import strategy.model.resources.ILabourModel;
	import strategy.controller.events.DayCycleEvent;
	
	public class ProcessDayStartCommand extends Command
	{
		[Inject]
		public var labourAvailabilityMarket:ILabourAvailabilityMarket;
		
		[Inject]
		public var labourPriceMarket:ILabourPriceMarket;
		
		[Inject]
		public var stoneAvailabilityMarket:IStoneAvailabilityMarket;
		
		[Inject]
		public var stonePriceMarket:IStonePriceMarket;
	   
	 	[Inject]
		public var labour:ILabourModel;
		
		override public function execute():void 
		{
			updateMarkets();
			reduceTeamToCore();
			dispatchDayStart();
		}
		
		private function updateMarkets():void
		{
			labourPriceMarket.move();
			labourAvailabilityMarket.move();
			stonePriceMarket.move();
			stoneAvailabilityMarket.move();
		}
		
		private function reduceTeamToCore():void
		{
			labour.setToMinimum();
		}
		
		private function dispatchDayStart():void
		{
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.NEW_DAY_STARTED);
			dispatch(evt);
		} 
	}
}