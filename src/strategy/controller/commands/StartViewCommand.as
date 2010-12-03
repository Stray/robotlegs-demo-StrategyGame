package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.PyramidGameView;
	import flash.display.Sprite;
	
	public class StartViewCommand extends Command
	{
		
		override public function execute():void 
		{
			var mainGameView:Sprite = new PyramidGameView();
			contextView.addChild(mainGameView);
		} 
	}
}