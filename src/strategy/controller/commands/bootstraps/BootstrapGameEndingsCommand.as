package strategy.controller.commands.bootstraps
{
	import strategy.controller.events.ResourceBoundaryEvent;
	import strategy.controller.commands.ProcessGameOverCommand;
	import strategy.controller.commands.ProcessGameWonCommand;
	import org.robotlegs.mvcs.Command;

	public class BootstrapGameEndingsCommand extends Command
	{
	
		override public function execute():void
		{
			commandMap.mapEvent(ResourceBoundaryEvent.BOUNDARY_BREACHED, ProcessGameOverCommand, ResourceBoundaryEvent);
			commandMap.mapEvent(ResourceBoundaryEvent.TARGET_REACHED, ProcessGameWonCommand, ResourceBoundaryEvent);
		}
	
	}

}