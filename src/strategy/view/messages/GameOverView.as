package strategy.view.messages {
	
	import flash.display.Sprite;
	import strategy.view.messages.BaseGameMessageView;
	import skins.PyramidGameSkin;
	
	public class GameOverView extends BaseGameMessageView {
		
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: GameOverViewMediator 
		 * 
		 */
		
		public function GameOverView(message:String) {			
			init(PyramidGameSkin.GameOverSkin);
			setFieldValue('message_txt', message);
		}
		
		
	}
}