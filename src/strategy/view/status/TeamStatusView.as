package strategy.view.status {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	import strategy.view.WorkerView;
	
	public class TeamStatusView extends Sprite {
		
		protected var workers:Vector.<WorkerView>;
		
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
			trace("updateTeamSize: " + teamSize);
			var iLength:uint = workers.length;
			for (var i:int = 0; i < iLength; i++)
			{
				workers[i].visible = (i<teamSize);
			}
		}
		
		public function updateSuspensions(suspensions:Vector.<Boolean>):void
		{
			trace("TeamStatusView::updateSuspensions(): " + suspensions);
			var iLength:uint = Math.min(workers.length, suspensions.length);
			for (var i:int = 0; i < iLength; i++)
			{
				workers[i].suspended = suspensions[i];
			}
		}
		    
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite;
			addChild(skin);
		    workers = new Vector.<WorkerView>();
		
			var iLength:uint = 4;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextWorkerView:WorkerView = new WorkerView(skin.getChildByName('worker_' + (i+1).toString()) as Sprite);
				workers.push(nextWorkerView);
				addChild(nextWorkerView);
			}
		}
		
		
		
	}
}