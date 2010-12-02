package strategy.view.status {
	
	import strategy.view.status.BaseStatusView;
	import skins.PyramidGameSkin;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class StoneStockStatusView extends BaseStatusView {
		
		protected var capacityText:TextField;
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: StoneStockStatusViewMediator 
		 * 
		 */
		
		public function StoneStockStatusView() {			
			init(PyramidGameSkin.StoneStockStatusSkin);
		}
		
		public function updateCapacity(value:Number):void
		{
			capacityText.text = Math.round(value).toString();
		}
		
	    override protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			statusText = skin.getChildByName("status_txt") as TextField;
			capacityText = skin.getChildByName("capacity_txt") as TextField;
			addChild(skin);
		}
		
	}
}