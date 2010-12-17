package strategy.controller.commands.daycycle 
{
	
	import strategy.model.gameplay.dilemmas.WeekendWorkingDilemma;
	import strategy.controller.events.DilemmaEvent;
	import strategy.model.gameplay.IDilemmaVO;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.core.IOptionCommandMapper;
	
	public class OfferWeekendWorkingCommand extends Command
	{
		override public function execute():void 
		{
			var weekendDilemma:IDilemmaVO = new WeekendWorkingDilemma();
			
			var evt:DilemmaEvent = new DilemmaEvent(DilemmaEvent.DILEMMA_PRESENTED, weekendDilemma);
			dispatch(evt);
		}
		 
	}
}