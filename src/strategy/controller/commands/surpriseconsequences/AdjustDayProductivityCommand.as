package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.base.OptionEvent;
	import strategy.model.resources.ILabourModel;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	
	public class AdjustDayProductivityCommand extends Command
	{
		[Inject]
		public var optionEvent:OptionEvent; 
		
		[Inject]
		public var labour:ILabourModel;
				
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			labour.changeTodaysProductivityBy(dilemmaConfig.productivity);
		} 
	}
}