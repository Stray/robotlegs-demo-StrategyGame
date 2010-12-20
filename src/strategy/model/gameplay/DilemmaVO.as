package strategy.model.gameplay {
	
	import flash.display.Sprite;
	
	public class DilemmaVO implements IDilemmaVO {
		
		protected var _title:String;
		protected var _question:String;
		protected var _options:Vector.<IOptionVO>;
		protected var _image:Sprite;
		
		public function DilemmaVO(title:String, question:String, options:Vector.<IOptionVO>, image:Sprite) {
			//trace("DilemmaVO::()",  title, question, options, image);
			_title = title;
			_question = question;
			_options = options;
			_image = image;
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
		
		public function get image():Sprite
		{
			return _image;
		}
                                  
	}
}