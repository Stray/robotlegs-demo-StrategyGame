package strategy.model.gameplay {
	
	public class DilemmaVO implements IDilemmaVO {
		
		protected var _title:String;
		protected var _question:String;
		protected var _options:Vector.<IOptionVO>;
		
		public function DilemmaVO(title:String, question:String, options:Vector.<IOptionVO>) {
			_title = title;
			_question = question;
			_options = options;
		}
		
		//---------------------------------------
		// IDilemmaVO Implementation
		//---------------------------------------

		//import strategy.model.gameplay.IDilemmaVO;
		public function get title():String
		{
			return _title;
		}

		public function get question():String
		{
			return _question;
		}

		public function get options():Vector.<IOptionVO>
		{
			return _options;
		}

		 
	}
}
