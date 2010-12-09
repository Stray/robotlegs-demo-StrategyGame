package strategy.view.messages {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import org.osflash.signalsv1.Signal;
	
	public class DaySummaryView extends Sprite {   
		
		protected var _quantityText:TextField;
		protected var _costText:TextField;
		protected var _submitSignal:Signal;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: DaySummaryViewMediator 
		 * 
		 */
		
		public function DaySummaryView(blocksBuilt:Number, wagesPaid:Number) {			
			trace("DaySummaryView::()");
			init(PyramidGameSkin.DailyProgressSummarySkin);
			_quantityText.text = blocksBuilt.toString();
			_costText.text = wagesPaid.toString() + " coins";
		} 
		
		public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal();
		}
		
		
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			addChild(skin);
			_quantityText = skin.getChildByName("quantity_txt") as TextField;
			_costText = skin.getChildByName("cost_txt") as TextField;
			
			var submitBtn:SimpleButton = skin.getChildByName("submit_btn") as SimpleButton;
			submitBtn.addEventListener(MouseEvent.CLICK, submitClickedHandler);
		}
		
		protected function submitClickedHandler(e:MouseEvent):void
		{
			submitSignal.dispatch();
		}
		
		
	}
}