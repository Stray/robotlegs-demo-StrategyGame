package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ICashModel;
	import strategy.controller.events.GameWonEvent;
	
	public class ProcessGameWonCommand extends Command
	{
		
		[Inject]
		public var cashModel:ICashModel;
		
		[Inject]
		public var calendarModel:ICalendarModel;
		
		override public function execute():void 
		{
			var cashRemaining:Number = cashModel.currentValue;
			var daysRemaining:uint = calendarModel.currentValue;
			var evt:GameWonEvent = new GameWonEvent(GameWonEvent.GAME_WON, daysRemaining, cashRemaining);
			dispatch(evt);
		} 
	}
}