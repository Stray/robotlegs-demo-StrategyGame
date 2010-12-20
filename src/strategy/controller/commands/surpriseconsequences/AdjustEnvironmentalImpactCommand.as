package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class AdjustEnvironmentalImpactCommand extends Command
	{
	   	[Inject]
		public var optionEvent:OptionEvent;
		
		[Inject]
		public var environmentModel:IEnvironmentalImpactModel;
				
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			environmentModel.adjustByValue(dilemmaConfig.environment);
			environmentModel.dailyImpact = dilemmaConfig.dailyEnvironmentChange;
		} 
	}
}