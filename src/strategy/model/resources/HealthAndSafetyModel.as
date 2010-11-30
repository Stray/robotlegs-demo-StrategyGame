package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	
	public class HealthAndSafetyModel extends GameFactorModel implements IHealthAndSafetyModel {
		
		public function HealthAndSafetyModel() {
			updateType = ResourceStatusEvent.HEALTH_AND_SAFETY_UPDATED;
		}
		
	}
}