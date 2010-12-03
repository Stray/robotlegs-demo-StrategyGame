package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import skins.PyramidGameSkin;
	import strategy.PyramidGameContext;
	
	public class PyramidGame extends Sprite {
        
		protected var _context:PyramidGameContext;

		public function PyramidGame() {
			_context = new PyramidGameContext(this);
		}
	}
}