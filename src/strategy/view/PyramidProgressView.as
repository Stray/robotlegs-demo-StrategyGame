package strategy.view {
	
	import flash.display.Sprite;
	import skins.PyramidGameSkin;
	import flash.display.MovieClip;
	                                 
	import fl.motion.BezierSegment;
	
	public class PyramidProgressView extends Sprite {
		
		protected var _pyramidBuilding:MovieClip;
		protected const SIN_60:Number = 0.86;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: PyramidProgressViewMediator 
		 * 
		 */
		
		public function PyramidProgressView() {			
			init();
		}
		
		
		public function showProgress(percentage:Number):void
		{
			var height:Number = solveForArea(percentage); 
			
			trace(height);
			
			var progressFrame:uint = Math.floor(height);
			
			if(progressFrame > _pyramidBuilding.currentFrame)
			{
				_pyramidBuilding.gotoAndStop(progressFrame);
			}
		}
		 
		protected function init():void
		{
			var skin:Sprite = new PyramidGameSkin.PyramidProgressSkin() as Sprite;
			addChild(skin);
			
			_pyramidBuilding = skin.getChildByName("pyramid_progress") as MovieClip;
			_pyramidBuilding.stop();
		}
		
		protected function solveForArea(area:Number):Number
		{
			if(area > 100)
			{
				return 100;
			}  
			
			var remainderArea:Number = 100 - Math.abs(area);
			
			var calc:Number = 4*remainderArea;
			calc = calc/ Math.sqrt(3);
			
			calc = Math.sqrt(calc);
			
			calc = calc * SIN_60;
			
			calc = (100 * calc)/13.2;

			return (100 - calc);
		}
		
	}
}