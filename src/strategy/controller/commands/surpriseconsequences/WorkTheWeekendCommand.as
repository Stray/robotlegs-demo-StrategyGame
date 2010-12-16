package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.IWorker;
	import strategy.controller.events.DayCycleEvent;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import org.robotlegs.base.OptionEvent;
	
	public class WorkTheWeekendCommand extends Command
	{
		[Inject]
		public var labourModel:ILabourModel;
		
		[Inject]
		public var optionEvent:OptionEvent;
		
		override public function execute():void 
		{
			var dilemmaConfig:DilemmaConfig = optionEvent.payload as DilemmaConfig;
			labourModel.adjustTeamEnergy(dilemmaConfig.productivity);
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.WORKING_DAY_STARTED);
			dispatch(evt);
		} 
	}
}