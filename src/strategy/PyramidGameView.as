package strategy {
	
	import flash.display.Sprite;
	import strategy.view.status.ProgressStatusView;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.CashStatusView;
	import strategy.view.status.TeamStatusView;
	import strategy.view.status.CalendarStatusView;
	
	public class PyramidGameView extends Sprite {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: PyramidGameViewMediator 
		 * 
		 */
		
		public function PyramidGameView() {			
			init();
		}
		
		protected function init():void
		{
			var progressView:Sprite = new ProgressStatusView();
			addChild(progressView);
			
			var stoneStockView:Sprite = new StoneStockStatusView();
			addChild(stoneStockView);
			
			var cashStatusView:Sprite = new CashStatusView();
			addChild(cashStatusView);
			
			var teamStatusView:Sprite = new TeamStatusView();
			addChild(teamStatusView);
			
			var calendarStatusView:Sprite = new CalendarStatusView();
			addChild(calendarStatusView);
		}
		
		
	}
}