package strategy.view.status
{
	import flash.display.Sprite;

	public class BaseGaugeStatusView extends Sprite
	{
	    protected var _range:Number;
		protected var _indicator:Sprite;
		
		public function BaseGaugeStatusView()
		{
			super();
		} 
	
		public function updateStatus(value:Number):void
		{
			var xPosition:Number = _range * (value/100);
			_indicator.x = xPosition;
		}
	
		protected function init(skinClass:Class):void
		{
			var skin:Sprite = new skinClass() as Sprite; 
			addChild(skin);
			var thermometer:Sprite = skin.getChildByName('thermometer') as Sprite;
			var thermometer_background:Sprite = thermometer.getChildByName('thermometer_background') as Sprite;
			_range = thermometer_background.width;
			_indicator = thermometer.getChildByName('indicator') as Sprite;
		}
	
	
	}
  
}