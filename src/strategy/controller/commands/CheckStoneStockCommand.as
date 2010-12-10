package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IStoneSupplyModel;
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.events.StoneStockCheckEvent;
	
	public class CheckStoneStockCommand extends Command
	{
		
		[Inject]
		public var stoneSupply:IStoneSupplyModel;
		
		override public function execute():void 
		{
			if(stoneSupply.currentValue <= stoneSupply.max)
			{
				passStockCheck();
			}
			else
			{
				findStockStolen();
			}
		}
		
		protected function passStockCheck():void
		{
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.STONE_STOCK_CHECKED);
			dispatch(evt);
		}
		
		protected function findStockStolen():void
		{
			var excessStone:Number = stoneSupply.currentValue - stoneSupply.max;
			var stoneStolen:Number = Math.round(excessStone * Math.random());
			stoneSupply.adjustByValue(-stoneStolen);
			var evt:StoneStockCheckEvent = new StoneStockCheckEvent(StoneStockCheckEvent.STOCK_STOLEN, stoneStolen);
			dispatch(evt);
		} 
	}
}