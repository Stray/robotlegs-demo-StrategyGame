package strategy {
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.base.GuardedCommandMap;
	import org.robotlegs.base.OptionCommandMap;
	import org.robotlegs.base.RelaxedEventMap;
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IGuardedCommandMap;
	import org.robotlegs.core.IOptionCommandMap;
	import org.robotlegs.core.IRelaxedEventContext;
	import org.robotlegs.core.IRelaxedEventMap;
	import org.robotlegs.mvcs.Context;
	import strategy.controller.commands.bootstraps.BootstrapGameStartup;
	import strategy.controller.commands.RestartGameCommand;
	import strategy.controller.commands.StartGameCommand;
	import strategy.controller.events.GameEvent;
	
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
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, BootstrapGameStartup, ContextEvent, true);
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartGameCommand, ContextEvent, true);
			commandMap.mapEvent(GameEvent.GAME_RESTARTED, RestartGameCommand, GameEvent, true);
			
			// and we're done
			super.startup();
		}

		
		protected var _relaxedEventMap:IRelaxedEventMap;
		
		public function get relaxedEventMap():IRelaxedEventMap
		{
			return _relaxedEventMap ||= new RelaxedEventMap(eventDispatcher);
		}
		
		public function set relaxedEventMap(value:IRelaxedEventMap):void
		{
			_relaxedEventMap = value;
		}
		
		protected var _optionCommandMap:IOptionCommandMap;
		
		public function get optionCommandMap():IOptionCommandMap
		{
			return _optionCommandMap ||= new OptionCommandMap(eventDispatcher, injector, reflector);
		}
		
		protected var _guardedCommandMap:IGuardedCommandMap;
		
		public function get guardedCommandMap():IGuardedCommandMap
		{
			return _guardedCommandMap ||= new GuardedCommandMap(eventDispatcher, injector, reflector);
		}
		
		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(IRelaxedEventMap, relaxedEventMap);
			injector.mapValue(IOptionCommandMap, optionCommandMap);
			injector.mapValue(IGuardedCommandMap, guardedCommandMap);
		}
		
		override protected function get commandMap():ICommandMap
		{
			return _commandMap ||= guardedCommandMap;
		}
	}
}