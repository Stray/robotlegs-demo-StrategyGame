package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import skins.PyramidGameSkin;
	import strategy.PyramidGameContext;
	import mx.core.SpriteAsset;
	import strategy.controller.events.GameEvent;
	import flash.events.Event;
	
	public class PyramidGame extends Sprite {
        
		protected const PAUSE_FRAME_COUNT:uint = 25;
		
		protected var _context:PyramidGameContext;
		protected var _contextView:Sprite;
		
		protected var frameCount:uint;

		public function PyramidGame() {
			trace("PyramidGame::()");
			createNewContext();
		} 
		
		protected function listenForRestart():void
		{
			_contextView.addEventListener(GameEvent.GAME_RESTARTED, restartHandler);
		}
		
		protected function restartHandler(e:GameEvent):void
		{
			trace("PyramidGame::restartHandler()");
			removeChild(_contextView);
			_contextView = null;
			_context = null;
			restartAfterPause();
		}
				
		protected function restartAfterPause():void
		{
			frameCount = 0;
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		protected function enterFrameHandler(e:Event):void
		{
			frameCount++;
			if(frameCount > PAUSE_FRAME_COUNT)
			{
				removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
				createNewContext();
			}
		}
		
		protected function createNewContext():void
		{
			_contextView = new Sprite();
			addChild(_contextView);
			_context = new PyramidGameContext(_contextView);
			listenForRestart();
		}
	} 
	      
}