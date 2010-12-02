package strategy.view.status {
	
	import strategy.view.status.BaseStatusView;
	import skins.PyramidGameSkin;
	
	public class ProgressStatusView extends BaseStatusView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: ProgressStatusViewMediator 
		 * 
		 */
		
		public function ProgressStatusView() {			
			init(PyramidGameSkin.ProgressStatusSkin)
		}
		
		
		
	}
}