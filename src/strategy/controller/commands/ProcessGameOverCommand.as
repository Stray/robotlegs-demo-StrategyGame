package strategy.controller.commands 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.view.messages.IGameMessageText;
	import strategy.controller.events.GameOverEvent;
	
	public class ProcessGameOverCommand extends Command
	{
		[Inject]
		public var cashModel:ICashModel;
		
		[Inject]
		public var calendarModel:ICalendarModel;
		
		[Inject]
		public var gameMessageText:IGameMessageText;
		
		override public function execute():void 
		{
			var reason:String;
			
			if(timeIsUp && outOfMoney)
			{
				reason = gameMessageText.cashAndCalendarFailMessage;
			}
			else if(timeIsUp)
			{
				reason = gameMessageText.calendarFailMessage;
			}
			else if(outOfMoney)
			{
				reason = gameMessageText.cashFailMessage;
			}
			
			var evt:GameOverEvent = new GameOverEvent(GameOverEvent.GAME_OVER, reason);
			dispatch(evt);
			
		}
		
		private function get timeIsUp():Boolean
		{
			return calendarModel.currentValue <= 0;
		}
		
		private function get outOfMoney():Boolean
		{
			return cashModel.currentValue <= 0;
		} 
	}
}