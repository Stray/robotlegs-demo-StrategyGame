package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.IStoneSupplyModel;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class DoubleStoneStorageCommand extends Command
	{
		[Inject]
		public var cash:ICashModel;
		
		[Inject]
		public var stoneStock:IStoneSupplyModel;
		
		[Inject]
		public var optionEvent:OptionEvent;

		
		override public function execute():void 
		{
			trace("DoubleStoneStorageCommand::execute()");
			
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			
			cash.adjustByValue(dilemmaConfig.cash);
			
			stoneStock.max = stoneStock.max + dilemmaConfig.stoneCapacity;
		} 
	}
}