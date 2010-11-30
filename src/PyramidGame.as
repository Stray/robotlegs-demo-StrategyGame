package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import skins.PyramidGameSkin;
	
	public class PyramidGame extends Sprite {

		public function PyramidGame() {
			addChild(new PyramidGameSkin.ProjectSprouts() as DisplayObject);
			trace("PyramidGame instantiated!");
		}
	}
}
