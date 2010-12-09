package strategy.view.decisions {
	
	import flash.display.Sprite; 
	import skins.PyramidGameSkin;
	import flash.text.TextField;
	
	//StoneDeliveryDilemmaSkin
	
	public class StoneDilemmaView extends StoneOfferView implements IStoneOfferView {
		
		protected var _message:String;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: StoneDilemmaViewMediator 
		 * 
		 */
		
		public function StoneDilemmaView(price:Number, availability:Number, message:String) {			
			_message = message;
			_skinClass = PyramidGameSkin.StoneDeliveryDilemmaSkin;
			super(price, availability);
		}
		
		override protected function init(skinClass:Class):void
		{
			super.init(skinClass);
 			var skin:Sprite = getChildAt(0) as Sprite;
		    var messageField:TextField = skin.getChildByName('message_txt') as TextField;
			messageField.text = _message;
		}
		
	}
}