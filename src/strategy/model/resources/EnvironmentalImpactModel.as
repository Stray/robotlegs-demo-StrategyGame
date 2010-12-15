package strategy.model.resources {
	
	import strategy.model.base.GameImpactFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class EnvironmentalImpactModel extends GameImpactFactorModel implements IEnvironmentalImpactModel {
		
		public function EnvironmentalImpactModel() {
			updateType = ResourceStatusEvent.ENVIRONMENTAL_IMPACT_UPDATED;
		}
		
	}
}