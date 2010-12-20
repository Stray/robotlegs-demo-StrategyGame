package strategy.view.messages {
	
	import flash.display.Sprite;
	import strategy.view.messages.BaseGameMessageView;
	import skins.PyramidGameSkin;
	import gs.TweenLite;
	
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
		
		public function StoneStockCheckView(quantityStolen:Number, withInsurance:Boolean = false) {			
			init(PyramidGameSkin.StoneStockCheckSkin);
			setFieldValue('quantity_txt', quantityStolen.toString()+ " stones"); 
			showInsuranceStamp(withInsurance);
		}
		
		private function showInsuranceStamp(withInsurance:Boolean):void
		{
			if(withInsurance)
			{
				var insuranceStamp:Sprite = _skin.getChildByName("insurance_stamp") as Sprite;
				TweenLite.to(insuranceStamp, 0.3, {alpha:1, scaleX:1, scaleY:1, delay:3})
			}
		}
		
	}
}