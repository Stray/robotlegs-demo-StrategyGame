package strategy.model.gameplay {
	                                 
	import strategy.model.gameplay.DilemmaVO;
	import flash.display.Sprite;
	
	public class DilemmaVOSupport extends DilemmaVO {
		
		// Testable constants
		//public static const MY_CONST:String = 'myConstant';
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		public function DilemmaVOSupport(id:uint = 1, totalOptions:uint = 1) {			
			// pass constants to the super constructor for properties
			var title:String = "Dilemma title " + id.toString();
			var question:String = "Dilemma question " + id.toString();
			var options:Vector.<IOptionVO> = new Vector.<IOptionVO>();
			
			var iLength:uint = totalOptions;
			for (var i:int = 0; i < iLength; i++)
			{
				var option:IOptionVO = new OptionVOSupport(i+1);
				options.push(option);
			}
			
			super(title, question, options, new Sprite());
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		
		
	}
}