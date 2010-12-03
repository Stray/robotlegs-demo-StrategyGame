package strategy {
	
	import flash.display.Sprite;
	import strategy.view.status.ProgressStatusView;
	
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
		}
		
		
	}
}