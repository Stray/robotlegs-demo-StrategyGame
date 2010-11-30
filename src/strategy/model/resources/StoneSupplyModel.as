package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class StoneSupplyModel extends GameFactorModel implements IStoneSupplyModel {
		
		public function StoneSupplyModel() {
			updateType = ResourceStatusEvent.STONE_SUPPLY_UPDATED;
		}
		
	}
}