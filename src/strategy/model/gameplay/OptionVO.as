package strategy.model.gameplay {
	
	public class OptionVO implements IOptionVO {
		
		protected var _title:String;
		protected var _id:uint;
		protected var _consequences:Vector.<Class>;
		
		public function OptionVO(id:uint, title:String, consequences:Vector.<Class>) {
			_id = id;
			_title = title;
			_consequences = consequences;
		}
		
		//---------------------------------------
		// IOptionVO Implementation
		//---------------------------------------

		//import strategy.model.gameplay.IOptionVO;
		public function get title():String
		{
			return _title;
		}

		public function get id():uint
		{
			return _id;
		}

		public function get consequences():Vector.<Class>
		{
			return _consequences;
		}

		 
	}
}
