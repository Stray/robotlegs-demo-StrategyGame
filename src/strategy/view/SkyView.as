package strategy.view {
	
	import flash.display.Sprite;
	import gs.TweenLite;
	import skins.PyramidGameSkin;
	
	public class SkyView extends Sprite {
		
		private const TOTAL_MOVEMENT:Number = 600; 
		
		private var nightSky:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: SkyViewMediator 
		 * 
		 */
		
		public function SkyView() {			
			init();
		}
		
		public function day():void
		{
			TweenLite.to(nightSky, 2, {alpha:0});
		}
		
		public function night():void
		{
			TweenLite.to(nightSky, 2, {alpha:1});
		}
		
		public function showDayPercentage(percentage:Number):void
		{
			var xPos:Number = (percentage/100) * 600;
			moveTo(xPos);
		}
		
		protected function moveTo(xPos:Number):void
		{
			if(xPos < this.x)
			{
				this.x = xPos;
				return;
			}          
			else
			{
				TweenLite.to(this, 3, {x:xPos});
			}
		}
		
		protected function init():void
		{
			var skin:Sprite = new PyramidGameSkin.SkySkin() as Sprite;
			addChild(skin);
			            
			nightSky = skin.getChildByName("night") as Sprite;
			
		}   
		
	}
}