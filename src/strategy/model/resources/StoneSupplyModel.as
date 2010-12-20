package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class StoneSupplyModel extends GameFactorModel implements IStoneSupplyModel {
		
		public function StoneSupplyModel() {
			updateType = ResourceStatusEvent.STONE_SUPPLY_UPDATED;
		}
		
		override public function set max(value:Number):void
		{
			if(value != _max)
			{
				_max = value;
				var evt:ResourceStatusEvent = new ResourceStatusEvent(ResourceStatusEvent.STONE_CAPACITY_UPDATED, _max, 100);
				dispatch(evt);
			}
		}
		
		private var _isInsured:Boolean;

		public function get isInsured():Boolean
		{
			return _isInsured;
		}

		public function set isInsured(value:Boolean):void
		{
			if (value !== _isInsured)
			{
				_isInsured = value;
			}
		}
		
	}
}