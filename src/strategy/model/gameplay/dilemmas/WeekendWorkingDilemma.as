package strategy.model.gameplay.dilemmas {
	
	import strategy.model.gameplay.DilemmaVO;
	import strategy.model.gameplay.IOptionVO;
	import strategy.controller.commands.surpriseconsequences.WorkTheWeekendCommand;
	import strategy.model.gameplay.OptionVO;
	import strategy.controller.commands.surpriseconsequences.RestTheWeekendCommand;
	import skins.SurprisesSkin;
	import strategy.model.gameplay.DilemmaOptionVO;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import strategy.model.IGameConfig;
	
	public class WeekendWorkingDilemma extends DilemmaVO {
		
		protected const TITLE:String = "It's the weekend";
		protected const QUESTION:String = "Would you like the team to do overtime this weekend?";
		
		protected const WORK_OPTION_TITLE:String = "Work overtime";
		protected const REST_OPTION_TITLE:String = "Rest";
		
		private var config:IGameConfig;
		
		public function WeekendWorkingDilemma() {
			super(TITLE, QUESTION, createOptions(), new SurprisesSkin.Weekend());
		}
		
		protected function createOptions():Vector.<IOptionVO>
		{
			var workOption:IOptionVO = new DilemmaOptionVO(1, WORK_OPTION_TITLE, Vector.<Class>([WorkTheWeekendCommand]), workImpactConfig);
			var restOption:IOptionVO = new DilemmaOptionVO(2, REST_OPTION_TITLE, Vector.<Class>([RestTheWeekendCommand]), restImpactConfig);
			var optionsVector:Vector.<IOptionVO> = new Vector.<IOptionVO>();
			optionsVector.push(workOption);
			optionsVector.push(restOption);
			return optionsVector;                  
		}   
		
		private function get workImpactConfig():DilemmaConfig
		{
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withProductivity(-10).build();
			return dilemmaConfig;
		}
		
		private function get restImpactConfig():DilemmaConfig
		{
			var dilemmaConfig:DilemmaConfig = new DilemmaConfigBuilder().withProductivity(10).build();
			return dilemmaConfig;
		}
	}
}