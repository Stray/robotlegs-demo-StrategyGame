package <%= package_name %> {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	import com.jpk.academy.modules.modulemanager.api.ExitEvent;
	
	public class <%= class_name %>Mediator extends ModuleMediator {
		
		// declare the view to be injected
		[Inject]
		public var view:<%= class_name %>;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Avoid doing work in the constructor!
		 * onRegister() is the place to do things. 
		 * 
		 */
		
		public function <%= class_name %>Mediator() {
			// don't do stuff in the constructor of a mediator
		} 
		
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Initialize the view and register for events. 
		 * 
		 */
		override public function onRegister():void
		{			
			trace('onRegister in <%= class_name %>Mediator');
			
			// mapRedispatchInternally(Event.type);
			//mapRedispatchToModules(LessonLoadRequestEvent.LESSON_REQUESTED);
			eventMap.mapListener(moduleDispatcher, ExitEvent.PREPARE_FOR_EXIT, prepareForExitHandler);
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//-------------------------------------------------------------------------- 
		
		private function prepareForExitHandler(e:ExitEvent):void{
			var evt:ExitEvent = new ExitEvent(ExitEvent.READY_FOR_EXIT, view);
			moduleDispatcher.dispatchEvent(evt);
		}
	}
}