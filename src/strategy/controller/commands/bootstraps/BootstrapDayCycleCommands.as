package strategy.controller.commands.bootstraps
{
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.commands.OfferStoneCommand;
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.controller.commands.TakeStoneDeliveryCommand;
	import strategy.controller.commands.ProcessDayEndCommand;
	import strategy.controller.commands.ProcessDayStartCommand;
	import strategy.controller.commands.OfferLabourCommand;
	import strategy.controller.events.LabourSupplyEvent;
	import strategy.controller.commands.HireWorkersCommand;
	import strategy.controller.commands.SkipHireWorkersCommand;
	import strategy.controller.commands.CheckStoneStockCommand;

	public class BootstrapDayCycleCommands extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(DayCycleEvent.NEW_DAY_STARTED, CheckStoneStockCommand, DayCycleEvent);
			commandMap.mapEvent(DayCycleEvent.STONE_STOCK_CHECKED, OfferStoneCommand, DayCycleEvent);
			commandMap.mapEvent(StoneSupplyEvent.STONE_PURCHASED, TakeStoneDeliveryCommand, StoneSupplyEvent);
			commandMap.mapEvent(DayCycleEvent.STONE_DELIVERY_COMPLETED, OfferLabourCommand, DayCycleEvent);
			commandMap.mapEvent(LabourSupplyEvent.WORKERS_HIRED, HireWorkersCommand, LabourSupplyEvent);
			commandMap.mapEvent(LabourSupplyEvent.NO_WORKERS_OFFERED, SkipHireWorkersCommand, LabourSupplyEvent);
			commandMap.mapEvent(LabourSupplyEvent.NO_WORKERS_HIRED, SkipHireWorkersCommand, LabourSupplyEvent);
			commandMap.mapEvent(DayCycleEvent.LABOUR_HIRE_COMPLETED, ProcessDayEndCommand, DayCycleEvent);
			commandMap.mapEvent(DayCycleEvent.DAY_ENDED, ProcessDayStartCommand, DayCycleEvent); 
		}
	
	}

}