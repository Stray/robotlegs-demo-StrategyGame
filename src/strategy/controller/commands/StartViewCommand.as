package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.PyramidGameView;
	import flash.display.Sprite;
	import strategy.view.SkyView;
	import skins.PyramidGameSkin;
	
	public class StartViewCommand extends Command
	{
		
		override public function execute():void 
		{
			addBackground();
			addGame();
			addForeground();
		}
		
		protected function addBackground():void
		{
			contextView.addChild(new SkyView());
	    }
	
		protected function addGame():void
		{
		 	var mainGameView:Sprite = new PyramidGameView();
			contextView.addChild(mainGameView);   
		} 

		protected function addForeground():void
		{
			contextView.addChild(new PyramidGameSkin.ForegroundSkin() as Sprite); 
		}
	}
}