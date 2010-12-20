package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class AdjustProgressCommand extends Command
	{
		
		[Inject]
		public var optionEvent:OptionEvent;
		
		[Inject]
		public var progress:IBuildingProgressModel;
				
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			progress.adjustByValue(dilemmaConfig.progress);
		} 
	}
}