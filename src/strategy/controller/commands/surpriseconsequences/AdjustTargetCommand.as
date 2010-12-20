package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class AdjustTargetCommand extends Command
	{
		[Inject]
		public var progress:IBuildingProgressModel;
		
		[Inject]
		public var optionEvent:OptionEvent;
				
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			progress.max = progress.max + dilemmaConfig.target;
		} 
	}
}