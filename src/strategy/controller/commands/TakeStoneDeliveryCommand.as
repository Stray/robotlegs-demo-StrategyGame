package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICashModel;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.model.resources.IStoneSupplyModel;
	import strategy.model.transactions.StoneTransactionVO;
	
	public class TakeStoneDeliveryCommand extends Command
	{
		[Inject]
		public var stoneSupplyEvent:StoneSupplyEvent;
		
		[Inject]
		public var cashModel:ICashModel;
		
		[Inject]
		public var stoneSupplyModel:IStoneSupplyModel;
		
		override public function execute():void 
		{
			var transactionVO:StoneTransactionVO = stoneSupplyEvent.transactionVO;
			var quantity:Number = transactionVO.quantity;
			var price:Number = transactionVO.price;
			
			stoneSupplyModel.adjustByValue(quantity);
			
			var cost:Number = quantity * price;
			
			cashModel.adjustByValue(-cost);
		} 
	}
}