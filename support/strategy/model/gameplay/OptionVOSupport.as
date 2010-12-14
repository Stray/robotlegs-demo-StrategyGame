package strategy.model.gameplay {
	                                 
	import strategy.model.gameplay.OptionVO;
	import org.robotlegs.mvcs.CommandSupport;
	
	public class OptionVOSupport extends OptionVO {
		
		// Testable constants
		//public static const MY_CONST:String = 'myConstant';
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		public function OptionVOSupport(id:uint = 1) {			
			// pass constants to the super constructor for properties
			var title:String = "Option title " + id.toString();
			var consequences:Vector.<Class> = new Vector.<Class>();
			consequences.push(CommandSupport);
			super(id, title, consequences);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		
		
	}
}