package strategy.view.decisions {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import org.osflash.signalsv1.Signal;
	import flash.events.MouseEvent;
	
	public class NoStoneView extends Sprite implements IStoneOfferView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: NoStoneViewMediator 
		 * 
		 */
		
		public function NoStoneView(message:String) {			
			
	    	init(PyramidGameSkin.StoneDeliveryNoStoneSkin, message);
		}

		protected var _submitSignal:Signal;

		public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal();
		}

		protected function init(skinClass:Class, message:String):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			addChild(skin);
			var messageText:TextField = skin.getChildByName("message_txt") as TextField;
            messageText.text = message;

			var submitBtn:SimpleButton = skin.getChildByName("submit_btn") as SimpleButton;
			submitBtn.addEventListener(MouseEvent.CLICK, submitClickedHandler);
		}

		protected function submitClickedHandler(e:MouseEvent):void
		{
				submitSignal.dispatch();
		}	
	
	         
		
	}
}