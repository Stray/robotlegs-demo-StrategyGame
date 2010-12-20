package strategy.controller.commands.daycycle 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DilemmaEvent;
	import org.robotlegs.core.IOptionCommandMapper;
	import strategy.model.gameplay.IDilemmaVO;
	
	public class MapDilemmaConsequencesCommand extends Command
	{
		[Inject]
		public var optionCommandMapper:IOptionCommandMapper;
		
		[Inject]
		public var dilemmaEvent:DilemmaEvent;
		
		override public function execute():void 
		{
			trace("MapDilemmaConsequencesCommand::execute()");
			var dilemmaVO:IDilemmaVO = dilemmaEvent.dilemmaVO;
			trace("dilemma: " + dilemmaVO.title);
			optionCommandMapper.mapDilemmaOptions(dilemmaVO.options);
		} 
	}
}