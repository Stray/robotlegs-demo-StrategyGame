package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.ResourceBoundaryEvent;
	
	public class BuildingProgressModel extends GameFactorModel implements IBuildingProgressModel 
	{
		
		public function BuildingProgressModel() 
		{
			updateType = ResourceStatusEvent.BUILDING_PROGRESS_UPDATED;
		}
		
		override protected function checkBoundaries():void
		{
			if(Math.round(currentValue) >= max)
			{
				var evt:ResourceBoundaryEvent = new ResourceBoundaryEvent(ResourceBoundaryEvent.TARGET_REACHED);
				dispatch(evt);
			}
		}
		
	}
}