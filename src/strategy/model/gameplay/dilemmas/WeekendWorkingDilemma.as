package strategy.model.gameplay.dilemmas {
	
	import strategy.model.gameplay.DilemmaVO;
	import strategy.model.gameplay.IOptionVO;
	import strategy.controller.commands.surpriseconsequences.WorkTheWeekendCommand;
	import strategy.model.gameplay.OptionVO;
	import strategy.controller.commands.surpriseconsequences.RestTheWeekendCommand;
	
	public class WeekendWorkingDilemma extends DilemmaVO {
		
		protected const TITLE:String = "It's the weekend";
		protected const QUESTION:String = "Would you like the team to do overtime this weekend?";
		
		protected const WORK_OPTION_TITLE:String = "Work overtime";
		protected const REST_OPTION_TITLE:String = "Rest";
		
		public function WeekendWorkingDilemma() {
			super(TITLE, QUESTION, createOptions());
		}
		
		protected function createOptions():Vector.<IOptionVO>
		{
			var workOption:IOptionVO = new OptionVO(1, WORK_OPTION_TITLE, Vector.<Class>([WorkTheWeekendCommand]));
			var restOption:IOptionVO = new OptionVO(2, REST_OPTION_TITLE, Vector.<Class>([RestTheWeekendCommand]));
			var optionsVector:Vector.<IOptionVO> = new Vector.<IOptionVO>();
			optionsVector.push(workOption);
			optionsVector.push(restOption);
			return optionsVector;                  
		} 
	}
}