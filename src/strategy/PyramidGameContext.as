package strategy {
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import strategy.controller.commands.ConfigureModelsCommand;
	import strategy.controller.commands.StartViewCommand;
	import strategy.controller.commands.ProcessDayStartCommand;
	import org.robotlegs.core.IRelaxedEventContext;
	import org.robotlegs.core.IRelaxedEventMap;
	import org.robotlegs.base.RelaxedEventMap;
	import strategy.controller.commands.bootstraps.BootstrapModels;
	import strategy.controller.commands.bootstraps.BootstrapViewMediators;
	import strategy.controller.commands.bootstraps.BootstrapDayCycleCommands;
	import strategy.controller.events.StoneSupplyEvent;
	import strategy.controller.commands.TakeStoneDeliveryCommand;
	
	public class PyramidGameContext extends Context implements IRelaxedEventContext {
		
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
		
		public function PyramidGameContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
			
			super(contextView, autoStartup);
		
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
			// Map some Commands to Events
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapModels, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapViewMediators, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapDayCycleCommands, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartViewCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ConfigureModelsCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ProcessDayStartCommand, ContextEvent, true);
			
			// Dependency injection for models, services and values
			// injector.mapSingleton(whenAskedFor:Class, named:String = null);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)

			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			
			// and we're done
			super.startup();
		}
		//---------------------------------------
		// IRelaxedEventContext Implementation
		//---------------------------------------

		//import org.robotlegs.core.IRelaxedEventContext;
		
		protected var _relaxedEventMap:IRelaxedEventMap;
		
		public function get relaxedEventMap():IRelaxedEventMap
		{
			return _relaxedEventMap ||= new RelaxedEventMap(eventDispatcher);
		}
		
		public function set relaxedEventMap(value:IRelaxedEventMap):void
		{
			_relaxedEventMap = value;
		}
		
		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(IRelaxedEventMap, relaxedEventMap);
		}

		
	}
}