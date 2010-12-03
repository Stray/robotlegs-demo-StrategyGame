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
		
	}
}