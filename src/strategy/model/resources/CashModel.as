package strategy.model.resources {
	
	import org.robotlegs.mvcs.Actor;
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.ResourceBoundaryEvent;
	
	public class CashModel extends GameFactorModel implements ICashModel {
		
		public function CashModel() {
			updateType = ResourceStatusEvent.CASH_UPDATED;
		}
		
		override protected function checkBoundaries():void
		{
			if(currentValue <= min)
			{
				var evt:ResourceBoundaryEvent = new ResourceBoundaryEvent(ResourceBoundaryEvent.BOUNDARY_BREACHED);
				dispatch(evt);
			}
		}
		
	}
}