package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.IHealthAndSafetyModel; 
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class AdjustSafetyCommand extends Command
	{
		[Inject]
		public var optionEvent:OptionEvent;
		
		[Inject]
		public var safety:IHealthAndSafetyModel;
				
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
		    safety.adjustByValue(dilemmaConfig.safety);
			if(safety.currentValue < 100)
			{
				safety.dailyImpact = dilemmaConfig.dailySafetyChange; 
			}
			else
			{
				safety.dailyImpact = safety.dailyImpact * dilemmaConfig.dailySafetyChange;
			}
		} 
	}
}