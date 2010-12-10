package strategy.view.messages {
	
	import flash.display.Sprite;
	import strategy.view.messages.BaseGameMessageView;
	import skins.PyramidGameSkin;
	
	public class StoneStockCheckView extends BaseGameMessageView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: StoneStockCheckViewMediator 
		 * 
		 */
		
		public function StoneStockCheckView(quantityStolen:Number) {			
			init(PyramidGameSkin.StoneStockCheckSkin);
			setFieldValue('quantity_txt', quantityStolen.toString()+ " stones");
		}
		
	}
}