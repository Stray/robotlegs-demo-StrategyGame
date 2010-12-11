package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.GameEvent;
	
	public class RestartGameCommand extends Command
	{
		
		override public function execute():void 
		{
			var evt:GameEvent = new GameEvent(GameEvent.GAME_RESTARTED);
			contextView.dispatchEvent(evt);
		} 
	}
}