package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class EnvironmentalImpactModel extends GameFactorModel implements IEnvironmentalImpactModel {
		
		public function EnvironmentalImpactModel() {
			updateType = ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED;
		}
		
	}
}