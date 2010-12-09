package com.newloop.roboteyes.core {
	
	import flash.display.DisplayObjectContainer;
	
	import flash.display.Sprite;
	
	import com.newloop.roboteyes.core.RobotEyesMaster;
	
	public class RobotEyes extends Sprite {
		
		private var _testApplication:DisplayObjectContainer;
		
		public function RobotEyes(applicationMainClazz:Class) {
			
			init(applicationMainClazz);
			
		}
		
		private function init(applicationMainClazz:Class):void{
			_testApplication = new applicationMainClazz() as DisplayObjectContainer;
			addChild(_testApplication);
			RobotEyesMaster.viewRoot = _testApplication;
		}
		
		public function get testApplication():*{
			return _testApplication;
		}
		
		public static function cleanUp():void
		{
			if(RobotEyesMaster.viewRoot == null)
			{
				return;
			}
			
			var appToRemove:Sprite = RobotEyesMaster.viewRoot as Sprite;
			RobotEyesMaster.viewRoot = null;         
			
			if((appToRemove.parent != null) && (appToRemove.parent.parent != null))
			{
				var grandParentView:DisplayObjectContainer = appToRemove.parent.parent as DisplayObjectContainer;
				grandParentView.removeChild(appToRemove.parent);
			}
			
			appToRemove = null;
		}
		
	}
}