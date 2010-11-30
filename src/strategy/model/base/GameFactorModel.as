package strategy.model.base {
		
import strategy.controller.events.ResourceStatusEvent;
	public class GameFactorModel extends GameMetricBaseModel implements IGameFactorModel {
		
		protected var updateType:String = ' ';
				
		public function GameFactorModel() {
		}  
		
		//---------------------------------------
		// IGameFactorModel Implementation
		//---------------------------------------

		//import strategy.model.base.IGameFactorModel;
		public function get currentPercentage():Number
		{
			return (((currentValue - min)/range) * 100);
		}

		public function set currentPercentage(value:Number):void
		{
			currentValue = min + (range * (value/100));
		}

		public function adjustByValue(value:Number):void
		{
			trace("GameFactorModel::adjustByValue(): ", value);
			trace("current value before: " + currentValue);
			currentValue = currentValue + value;
			trace("current value after: " + currentValue);
		}

		public function adjustByPercentage(value:Number):void
		{
			var factor:Number = 1 + (value/100);
			currentValue = currentValue * factor;
		}
		
		override protected function dispatchUpdateEvent():void
		{
			var evt:ResourceStatusEvent = new ResourceStatusEvent(updateType, currentValue, currentPercentage);
			dispatch(evt);
		}
		
	}
}