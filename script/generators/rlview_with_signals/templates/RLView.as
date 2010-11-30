package <%= package_name %> {
	
	import flash.display.Sprite;
	
	import org.osflash.signals.Signal;
	
	public class <%= class_name %> extends Sprite {
		
		
		private  var _signal:Signal;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: <%= class_name %>Mediator 
		 * 
		 */
		
		public function <%= class_name %>() {			
			initSignals();
		}
		
		
		
		
		private function initSignals():void
		{
			_signal = new Signal();
		}
		
	}
}
