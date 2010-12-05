package strategy.model.resources {
	
	import strategy.model.base.GameFactorModel;
	import strategy.controller.events.ResourceStatusEvent;
	import strategy.controller.events.ResourceBoundaryEvent;
	
	public class CalendarModel extends GameFactorModel implements ICalendarModel {
	                             
		public function CalendarModel() {
			updateType = ResourceStatusEvent.CALENDAR_UPDATED;
		}
		
		override protected function checkBoundaries():void
		{
			if(currentValue <= min)
			{
				var evt:ResourceBoundaryEvent = new ResourceBoundaryEvent(ResourceBoundaryEvent.BOUNDARY_BREACHED);
				dispatch(evt);
			}
		}
		
		//---------------------------------------
		// ICalendarModel Implementation
		//---------------------------------------

		//import strategy.model.resources.ICalendarModel;
		public function get daysPassed():uint
		{
			return (max - currentValue);
		}

		
	}
}