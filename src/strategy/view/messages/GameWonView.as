package strategy.view.messages {
	
	import flash.display.Sprite;
	import strategy.view.messages.BaseGameMessageView;
	import skins.PyramidGameSkin;
	
	public class GameWonView extends BaseGameMessageView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: GameWonViewMediator 
		 * 
		 */
		
		public function GameWonView(days:uint, cash:Number) {			
			init(PyramidGameSkin.GameWonSkin);                   
			setFieldValue("days_txt", days.toString() + " days");
			setFieldValue('cost_txt', cash.toString() + " coins");
		}
		
		
	}
}