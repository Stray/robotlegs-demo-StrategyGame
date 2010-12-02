package strategy.view.status {
	
	import skins.PyramidGameSkin;
	
	public class CashStatusView extends BaseStatusView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: CashStatusViewMediator 
		 * 
		 */
		
		public function CashStatusView() {			
			init(PyramidGameSkin.CashStatusSkin);
		}
		
		
		
	}
}