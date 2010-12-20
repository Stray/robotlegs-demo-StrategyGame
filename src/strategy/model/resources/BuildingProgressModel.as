package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.ResourceBoundaryEvent;
	
	public class BuildingProgressModel extends GameFactorModel implements IBuildingProgressModel 
	{
		
		public function BuildingProgressModel() 
		{
			updateType = ResourceStatusEvent.BUILDING_PROGRESS_UPDATED;
			_currentValue = 0;
		}
		
		override public function set max(value:Number):void
		{
			super.max = value;
			dispatchUpdateEvent();
		}   
		
		override protected function checkBoundaries():void
		{
			if(Math.round(currentValue) >= max)
			{
				trace("building complete: ", currentValue, max);
				var evt:ResourceBoundaryEvent = new ResourceBoundaryEvent(ResourceBoundaryEvent.TARGET_REACHED);
				dispatch(evt);
			}
		}
		
	}
}