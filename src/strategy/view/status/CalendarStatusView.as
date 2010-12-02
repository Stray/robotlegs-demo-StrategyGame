package strategy.view.status {
	
	import skins.PyramidGameSkin;
	
	public class CalendarStatusView extends BaseStatusView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: CalendarStatusViewMediator 
		 * 
		 */
		
		public function CalendarStatusView() {			
			init(PyramidGameSkin.CalendarStatusSkin);
		}
		
		
	}
}