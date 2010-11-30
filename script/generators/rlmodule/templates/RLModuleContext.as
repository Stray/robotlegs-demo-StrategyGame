package <%= package_name %> {
	
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	import org.robotlegs.utilities.modular.mvcs.ModuleContextView;
	import org.robotlegs.utilities.modular.base.ModuleContextEvent;
	
	public class <%= class_name %>Context extends ModuleContext {
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Factory method. Provide the Context with the necessary objects to do its work.
		 * Note that the both the injector and reflector are programmed to interfaces
		 * so you can freely change the IoC container and Reflection library you want
		 * to use as long as the 'contract' is fullfilled. See the adapter package
		 * in the RobotLegs source.
		 *
		 * @param contextView DisplayObjectContainer
		 * @param autoStartup Boolean
		 *
		 */
		
		public function <%= class_name %>Context(contextView:ModuleContextView = null) {
			
			super(contextView);
		
		}
		
		//--------------------------------------------------------------------------
		//
		//  Overridden API
		//
		//--------------------------------------------------------------------------
		/**
		 * Gets called by the framework if autoStartup is true. Here we need to provide
		 * the framework with the basic actors. The proxies/services we want to use in
		 * the model, map some view components to Mediators and to get things started,
		 * add some Sprites to the stage. Only after we drop a Sprite on the stage,
		 * RobotLegs will create the Mediator. 
		 *
		 */
		override public function startup():void
		{
			
			trace("startup");
			if(!_isModuleDispatcherSet){
				trace("DIAGNOSTIC HELPER: You need to set up the module dispatcher before you can run startup. If your app bails now... you'll know why.")
			}
			
			// Map some Commands to Events
			// commandMap.mapEvent(MyEvent.EVENT_NAME, MyCommand, MyEvent, isOneShot);
		    // moduleCommandMap.mapEvent(AcademyContentRequestEvent.CONTENT_SUPPLIED, PrepareMenuDataFromContentVOCommand, AcademyContentRequestEvent, true);
			
			// Dependency injection for models, services and values
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
			// mediatorMap.mapView(ViewClass, ViewMediatorClass)
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			
			// and we're done
			super.startup();
			
			var moduleStartupEvt:ModuleContextEvent = new ModuleContextEvent(ModuleContextEvent.MODULE_STARTUP_COMPLETE, moduleContextView);  
		   	moduleDispatcher.dispatchEvent(moduleStartupEvt);
			
		}
	}
}