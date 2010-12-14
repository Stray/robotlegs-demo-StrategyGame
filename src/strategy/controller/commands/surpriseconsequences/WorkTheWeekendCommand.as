package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.IWorker;
	import strategy.controller.events.DayCycleEvent;
	
	public class WorkTheWeekendCommand extends Command
	{
		[Inject]
		public var labourModel:ILabourModel;
		
		override public function execute():void 
		{
			labourModel.adjustTeamEnergy(-10);
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.WORKING_DAY_STARTED);
			dispatch(evt);
		} 
	}
}