package strategy.controller.surprises
{
	import org.robotlegs.mvcs.Actor;

	public class BaseSurpriseEventCaster extends Actor implements ISurpriseEventCaster
	{
	    protected var _surprisePercentageProbability:Number = 50;
		
		public function BaseSurpriseEventCaster()
		{
			super();
		}
		
		public function set surprisePercentageProbability(value:Number):void
		{
			_surprisePercentageProbability = value;
		} 
		
		public function castSurpriseEvent():void
		{
			if(_surprisePercentageProbability/100 > Math.random())
			{
				dispatchSurpriseEvent();
			}
			else
			{
				dispatchNormalEvent();
			}
		}
         
        public function castNormalEvent():void
		{
			dispatchNormalEvent();
		}

		public function primeSurpriseEvents():void
		{

		}
		
		protected function dispatchNormalEvent():void
		{

		}
		
		protected function dispatchSurpriseEvent():void
		{

		}
	
	}
 
}