package strategy {
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.BuildingProgressModel;
	import strategy.model.IGameConfig;
	import strategy.model.FirstGameConfig;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.CalendarModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.CashModel;
	import strategy.model.resources.LabourModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.IStoneSupplyModel;
	import strategy.model.resources.StoneSupplyModel;
	import strategy.PyramidGameView;
	import strategy.PyramidGameViewMediator;
	import strategy.view.status.ProgressStatusView;
	import strategy.controller.commands.ConfigureModelsCommand;
	import strategy.controller.commands.StartViewCommand;
	import strategy.view.status.ProgressStatusViewMediator;
	import strategy.model.markets.LabourPriceMarket;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.markets.LabourAvailabilityMarket;
	import strategy.model.markets.ILabourAvailabilityMarket;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.StoneStockStatusViewMediator;
	import strategy.view.status.CashStatusView;
	import strategy.view.status.CashStatusViewMediator;
	
	public class PyramidGameContext extends Context {
		
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
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartViewCommand, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, ConfigureModelsCommand, ContextEvent, true);
			// Dependency injection for models, services and values
			injector.mapSingletonOf(IGameConfig, FirstGameConfig);
			injector.mapSingletonOf(IBuildingProgressModel, BuildingProgressModel);
			
			injector.mapSingletonOf(ICalendarModel, CalendarModel);
			injector.mapSingletonOf(ICashModel, CashModel);
			injector.mapSingletonOf(ILabourModel, LabourModel);
			injector.mapSingletonOf(IStoneSupplyModel, StoneSupplyModel);
			injector.mapSingletonOf(ILabourPriceMarket, LabourPriceMarket);
			injector.mapSingletonOf(ILabourAvailabilityMarket, LabourAvailabilityMarket)
			// injector.mapSingleton(whenAskedFor:Class, named:String = null);
			// injector.mapClass(whenAskedFor:Class, instantiateClass:Class, named:String = null);
			// injector.mapValue(whenAskedFor:Class, useValue:Object, named:String = null);
			// injector.mapSingletonOf(whenAskedFor:Class, useSingletonOf:Class, named:String = null);
			
			// Bind Mediators to Views
			// The mediators are created automatically when the view is added to stage (within contextView)
			mediatorMap.mapView(PyramidGameView, PyramidGameViewMediator);
			mediatorMap.mapView(ProgressStatusView, ProgressStatusViewMediator);
			mediatorMap.mapView(StoneStockStatusView, StoneStockStatusViewMediator);
		    mediatorMap.mapView(CashStatusView, CashStatusViewMediator);
			// or - if your view is already on stage
			// mediatorMap.createMediator(viewObject);
			
			// and we're done
			super.startup();
		}
		
	}
}