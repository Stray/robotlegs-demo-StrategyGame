package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.surprises.IStoneSurpriseEventCaster;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.IGameConfig;
	
	public class OfferStoneCommand extends Command
	{
		[Inject]
		public var stoneSurpriseEventCaster:IStoneSurpriseEventCaster;
		
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var config:IGameConfig;
	            
		override public function execute():void 
		{
			if(calendarModel.daysPassed > config.numberOfNormalDaysAtStart)
			{
				stoneSurpriseEventCaster.castSurpriseEvent();
			}
			else
			{
				stoneSurpriseEventCaster.castNormalEvent();
			}
		} 
	}
}