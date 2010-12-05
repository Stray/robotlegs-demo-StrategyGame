package strategy.controller.commands.bootstraps
{
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.commands.OfferStoneCommand;
	import org.robotlegs.mvcs.Command;

	public class BootstrapDayCycleCommands extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(DayCycleEvent.NEW_DAY_STARTED, OfferStoneCommand, DayCycleEvent);
		}
	
	}

}