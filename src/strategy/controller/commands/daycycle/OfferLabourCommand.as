package strategy.controller.commands.daycycle
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.surprises.ILabourSurpriseEventCaster;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.IGameConfig;
	
	public class OfferLabourCommand extends Command
	{           
		[Inject]
		public var labourSurpriseEventCaster:ILabourSurpriseEventCaster; 
		
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var config:IGameConfig;
		
		override public function execute():void 
		{
			if(calendarModel.daysPassed > config.numberOfNormalDaysAtStart)
			{
				labourSurpriseEventCaster.castSurpriseEvent();
			}
			else
			{
				labourSurpriseEventCaster.castNormalEvent();
			}
		}
	}
}