package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.IWorker;
	
	public class WorkTheWeekendCommand extends Command
	{
		[Inject]
		public var labourModel:ILabourModel;
		
		override public function execute():void 
		{
			labourModel.adjustTeamEnergy(-10);
		} 
	}
}