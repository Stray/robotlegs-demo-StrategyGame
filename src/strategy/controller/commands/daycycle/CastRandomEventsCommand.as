package strategy.controller.commands.daycycle 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.IGameConfig;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
	
	public class CastRandomEventsCommand extends Command
	{
		[Inject]
	   	public var calendarModel:ICalendarModel;

		[Inject]
		public var config:IGameConfig;
		
		[Inject]
		public var dilemmaSurpriseEventCaster:IDilemmaSurpriseEventCaster;

		override public function execute():void 
		{
			if(calendarModel.daysPassed > config.numberOfNormalDaysAtStart)
			{
				dilemmaSurpriseEventCaster.castSurpriseEvent();
			}
			else
			{
				dilemmaSurpriseEventCaster.castNormalEvent();
			}
		}   
	}
}