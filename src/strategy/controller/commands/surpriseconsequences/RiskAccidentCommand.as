package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
	import org.robotlegs.core.IOptionCommandMap;
	
	public class RiskAccidentCommand extends Command
	{
		[Inject]
		public var dilemmaCaster:IDilemmaSurpriseEventCaster; 
		
		override public function execute():void 
		{
			dilemmaCaster.castAccidentWithPercentageProbability(50);
		} 
	}
}