package strategy.view.messages {
	
	import skins.PyramidGameSkin;
	import strategy.view.messages.BaseGameMessageView;
	
	public class DaySummaryView extends BaseGameMessageView {   
		
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
			init(PyramidGameSkin.DailyProgressSummarySkin);
			setFieldValue('quantity_txt', blocksBuilt.toString());
			setFieldValue('cost_txt', wagesPaid.toString() + " coins");
		} 
	    
	}
}