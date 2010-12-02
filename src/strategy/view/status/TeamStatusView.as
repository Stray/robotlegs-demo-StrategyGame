package strategy.view.status {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	
	public class TeamStatusView extends Sprite {
		
		protected var workers:Vector.<Sprite>;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: TeamStatusViewMediator 
		 * 
		 */
		
		public function TeamStatusView() {			
			init(PyramidGameSkin.TeamStatusSkin);
		}
		
		public function updateTeamSize(teamSize:uint):void
		{
			var iLength:uint = workers.length;
			for (var i:int = 0; i < iLength; i++)
			{
				workers[i].visible = (i<teamSize);
			}
		}
		
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			addChild(skin);
		    workers = new Vector.<Sprite>();
		
			var iLength:uint = 4;
			for (var i:int = 0; i < iLength; i++)
			{
				workers.push(skin.getChildByName('worker_' + (i+1).toString()) as Sprite);
			}
		}
		
		
		
	}
}