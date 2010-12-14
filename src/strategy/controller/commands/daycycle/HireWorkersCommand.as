package strategy.controller.commands.daycycle
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DayCycleEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.resources.ILabourModel;
	
	public class HireWorkersCommand extends Command
	{
		[Inject]
		public var labourSupplyEvent:LabourSupplyEvent;
		
		[Inject]
		public var labourModel:ILabourModel;
		
		override public function execute():void 
		{
			var workersHired:Vector.<WorkerProductivityVO> = labourSupplyEvent.workers;
			
			labourModel.appendWorkers(workersHired);
			   		
			var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.LABOUR_HIRE_COMPLETED);
			dispatch(evt);
		} 
	}
}