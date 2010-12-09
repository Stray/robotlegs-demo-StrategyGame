package strategy.controller.surprises {
	
	import org.robotlegs.mvcs.Actor;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.model.IGameConfig;
	
	public class LabourSurpriseEventCaster extends BaseSurpriseEventCaster implements ILabourSurpriseEventCaster {
		
		[Inject]
		public var labourAvailabilityMarket:ILabourAvailabilityMarket;
		
		[Inject]
		public var labourPriceMarket:ILabourPriceMarket;
		
		[Inject]
		public var config:IGameConfig;
		
		public function LabourSurpriseEventCaster() {
		}  
		
		override protected function dispatchNormalEvent():void
		{
			var evt:LabourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.NO_WORKERS_OFFERED, null);
			dispatch(evt);
		}
		
		override protected function dispatchSurpriseEvent():void
		{
			var workersVector:Vector.<WorkerProductivityVO> = createRandomWorkers();
			var evt:LabourSupplyEvent = new LabourSupplyEvent(LabourSupplyEvent.WORKERS_OFFERED, workersVector);
			dispatch(evt);
		}
		
		protected function createRandomWorkers():Vector.<WorkerProductivityVO>
		{
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			var numberOfWorkers:uint = 1 + Math.floor(labourAvailabilityMarket.currentValue);
			var iLength:uint = numberOfWorkers;
			for (var i:int = 0; i < iLength; i++)
			{                                                             
				var workerWages:Number = calculateRandomWage();
				var workerProductivity:Number = calculateRandomProductivity();
				var workerVO:WorkerProductivityVO = new WorkerProductivityVO(workerProductivity, workerWages);
				workers.push(workerVO);
			}
			
			return workers;
		}
		
		protected function calculateRandomWage():Number
		{
			var randomWage:Number = (Math.random() + 0.5) * labourPriceMarket.currentValue;
			return Math.round(randomWage);
		}
		
		protected function calculateRandomProductivity():Number
		{
			var randomProductivity:Number = (config.maximumWorkerProductivity + config.minimumWorkerProductivity) * Math.random();
			return Math.round(randomProductivity);
		}
		
	}
}