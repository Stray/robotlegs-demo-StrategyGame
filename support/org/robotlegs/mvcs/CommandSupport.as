package org.robotlegs.mvcs {
	                                 
	import org.robotlegs.mvcs.Command;
	
	public class CommandSupport extends Command {
		
		// Testable constants
		//public static const MY_CONST:String = 'myConstant';
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		
		public override function execute():void
		{
			trace("CommandSupport::execute()");
		}
		
	}
}
