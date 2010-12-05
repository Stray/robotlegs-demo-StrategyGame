package strategy.controller.commands.bootstraps
{
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.commands.OfferStoneCommand;
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.controller.commands.TakeStoneDeliveryCommand;

	public class BootstrapDayCycleCommands extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(DayCycleEvent.NEW_DAY_STARTED, OfferStoneCommand, DayCycleEvent);
			commandMap.mapEvent(StoneSupplyEvent.STONE_PURCHASED, TakeStoneDeliveryCommand, StoneSupplyEvent); 
		}
	
	}

}