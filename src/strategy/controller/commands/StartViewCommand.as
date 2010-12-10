package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.PyramidGameView;
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	
	public class StartViewCommand extends Command
	{
		
		override public function execute():void 
		{
			contextView.addChild(new PyramidGameSkin.BackgroundSkin() as Sprite);
			
			var mainGameView:Sprite = new PyramidGameView();
			contextView.addChild(mainGameView);

			contextView.addChild(new PyramidGameSkin.ForegroundSkin() as Sprite);
		} 
	}
}