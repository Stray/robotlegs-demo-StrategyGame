package strategy.view.decisions {
	
	import flash.display.Sprite;
	import strategy.model.transactions.WorkerProductivityVO;
	import org.osflash.signalsv1.Signal;
	import skins.PyramidGameSkin;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	public class WorkerForHireView extends Sprite {
		
		protected var _workerVO:WorkerProductivityVO;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: WorkerForHireViewMediator 
		 * 
		 */
		
		public function WorkerForHireView(workerVO:WorkerProductivityVO) {			
			init(workerVO);
			_workerVO = workerVO;
		}
		
		protected var _submitSignal:Signal;

		public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal(WorkerProductivityVO);
		}
		
		
		protected function init(workerVO:WorkerProductivityVO):void
		{
			var skin:Sprite = new PyramidGameSkin.WorkerForHireSkin() as Sprite;
			addChild(skin);
			
			var quantityField:TextField = skin.getChildByName('quantity_txt') as TextField;
			quantityField.text = workerVO.stonesBuilt.toString();
			
			var priceField:TextField = skin.getChildByName('price_txt') as TextField;
			priceField.text = workerVO.wagesPaid.toString();
			
			var submitButton:SimpleButton = skin.getChildByName('submit_btn') as SimpleButton;
			submitButton.addEventListener(MouseEvent.CLICK, submitHandler);
		}
		
		protected function submitHandler(e:MouseEvent):void
		{
			submitSignal.dispatch(_workerVO);
		}
		
	}
}