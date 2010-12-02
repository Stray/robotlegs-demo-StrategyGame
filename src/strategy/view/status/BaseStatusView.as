package strategy.view.status {
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class BaseStatusView extends Sprite {
		
		protected var statusText:TextField;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: CalendarStatusViewMediator 
		 * 
		 */
		
		public function BaseStatusView() {			
		}
		
		public function updateStatus(value:Number):void
		{
			statusText.text = Math.round(value).toString();
		}
		
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			statusText = skin.getChildByName("status_txt") as TextField;
			addChild(skin);
		}
		
		
	}
}
