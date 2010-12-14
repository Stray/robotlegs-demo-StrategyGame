package strategy.controller.commands.bootstraps
{
	import strategy.controller.events.GameEvent;
	import strategy.controller.commands.bootstraps.BootstrapModels;
	import strategy.controller.commands.bootstraps.BootstrapViewMediators;
	import strategy.controller.commands.bootstraps.BootstrapDayCycleCommands;
	import strategy.controller.commands.bootstraps.BootstrapGameEndingsCommand;
	import strategy.controller.commands.StartViewCommand;
	import strategy.controller.commands.ConfigureModelsCommand;
	import strategy.controller.commands.daycycle.ProcessDayStartCommand;
	import org.robotlegs.mvcs.Command;

	public class BootstrapGameStartup extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapModels, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapViewMediators, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapDayCycleCommands, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, BootstrapGameEndingsCommand, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, StartViewCommand, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, ConfigureModelsCommand, GameEvent, true);
			commandMap.mapEvent(GameEvent.GAME_STARTED, ProcessDayStartCommand, GameEvent, true);
		}
	
	}

}