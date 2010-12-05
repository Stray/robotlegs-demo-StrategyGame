package strategy.view.decisions {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	import flash.text.TextField;
	import flash.events.Event;
	import org.osflash.signalsv1.Signal;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class StoneOfferView extends Sprite {
		
		protected var _priceText:TextField;  
		protected var _availabilityText:TextField;
		protected var _quantityText:TextField;
		protected var _costText:TextField;
		protected var _price:Number;
		protected var _availability:Number;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: StoneOfferViewMediator 
		 * 
		 */
		
		public function StoneOfferView(price:Number, availability:Number) {			
			init(PyramidGameSkin.StoneDeliveryNormalSkin);
			setPrice(price);
			setAvailability(availability);
			zeroQuantityAndCost();
			addListeners(); 
		}
		
		protected var _submitSignal:Signal;

		public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal(Number, Number);
		}
		
		
		protected function setPrice(value:Number):void
		{
			_priceText.text = Math.round(value).toString() + " coins";
			_price = value;
		}
		
		protected function setAvailability(value:Number):void
		{
			_availabilityText.text = Math.round(value).toString();
			_availability = value;
		}
		
		protected function zeroQuantityAndCost():void
		{
			_quantityText.text = '0';
			_quantityText.restrict = "0-9"
			_costText.text = '0 coins';
		}
		
		protected function addListeners():void
		{
			_quantityText.addEventListener(Event.CHANGE, quantityChangedHandler);
		}
		
		protected function quantityChangedHandler(e:Event):void
		{
			if(isValidPurchase())
			{
				var cost:Number = quantity * _price;
				_costText.text = cost.toString() + " coins";
			}
			else
			{
				_costText.text = "not available";
			}
		} 
		
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			addChild(skin);
			_priceText = skin.getChildByName("price_txt") as TextField;
			_availabilityText = skin.getChildByName("availability_txt") as TextField;
			_quantityText = skin.getChildByName("quantity_txt") as TextField;
			_costText = skin.getChildByName("cost_txt") as TextField;
			
			var submitBtn:SimpleButton = skin.getChildByName("submit_btn") as SimpleButton;
			submitBtn.addEventListener(MouseEvent.CLICK, submitClickedHandler);
		}
		
		protected function submitClickedHandler(e:MouseEvent):void
		{
			if(isValidPurchase())
			{
				submitSignal.dispatch(quantity, _price);
		    }
		}
			
		protected function get quantity():Number
		{
			return Number(_quantityText.text);
		}
		
		protected function isValidPurchase():Boolean
		{
			return quantity <= _availability;
		}
		
	}
}