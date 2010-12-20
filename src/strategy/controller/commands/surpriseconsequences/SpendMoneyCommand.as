package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICashModel;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class SpendMoneyCommand extends Command
	{
		[Inject]
		public var cash:ICashModel;
		
		[Inject]
		public var optionEvent:OptionEvent;
		
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			cash.adjustByValue(dilemmaConfig.cash);
		} 
	}
}