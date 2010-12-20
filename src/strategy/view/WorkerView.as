package strategy.view {
	
	import flash.display.Sprite;
	
	public class WorkerView extends Sprite {
		
	    
		public function WorkerView(skin:Sprite) {
			addChild(skin);
			_suspended = skin.getChildByName('suspended') as Sprite;   
			_suspended.visible = false;
		}
		
		private var _suspended:Sprite;

		public function get suspended():Boolean
		{
			return _suspended.visible;
		}

		public function set suspended(value:Boolean):void
		{
			_suspended.visible = value;
		}
		 
	}
}