package strategy.view.status {
	
	import skins.PyramidGameSkin;
	import strategy.view.status.BaseGaugeStatusView;
	
	public class SafetyStatusView extends BaseGaugeStatusView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: SafetyStatusViewMediator 
		 * 
		 */
		
		public function SafetyStatusView() {			
			init(PyramidGameSkin.SafetyStatusSkin);
		}
		
		
		
	}
}