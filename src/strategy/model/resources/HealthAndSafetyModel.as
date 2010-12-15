package strategy.model.resources {
	
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.model.base.GameImpactFactorModel;
	
	public class HealthAndSafetyModel extends GameImpactFactorModel implements IHealthAndSafetyModel {
		
		public function HealthAndSafetyModel() {
			updateType = ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED;
		}
		
	}
}