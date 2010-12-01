package gameplay {

	import asunit.framework.TestCase;
	import flash.events.IEventDispatcher;
	import flash.events.EventDispatcher;
	import strategy.controller.events.ResourceBoundaryEvent;
	import asunit.errors.AssertionFailedError;
	import strategy.model.IGameConfig;
	import strategy.model.MinimumUnwinnableGameConfigSupport;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.BuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.CalendarModel;
	import strategy.model.resources.ILabourModel;
	import strategy.model.resources.LabourModel;
	import flash.events.Event;
	import strategy.controller.commands.ProcessDayEndCommand;

	public class MinimumUnwinnableGameTest extends TestCase {
		private var eventDispatcher:IEventDispatcher; 
		
		private var cycles:uint = 0;
		
		private var unwinnableGameConfig:IGameConfig;
		
		private var processDayEndCommand:ProcessDayEndCommand;
		
		public function MinimumUnwinnableGameTest(methodName:String=null) {
			super(methodName);
		}

		override protected function setUp():void {
			super.setUp();
			
			eventDispatcher = new EventDispatcher();
			unwinnableGameConfig = new MinimumUnwinnableGameConfigSupport();
			
			processDayEndCommand = new ProcessDayEndCommand();
			
			processDayEndCommand.buildingProgress = new BuildingProgressModel();
			processDayEndCommand.calendar = new CalendarModel(); 
			processDayEndCommand.labour = new LabourModel();
			
			configureModels(); 
		}

		override protected function tearDown():void {
			super.tearDown();
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_game_fails_after_10_cycles():void {
		
			var calendarHandler:Function = addAsync(handle_calendar_boundary_breached, 1000);
			var buildingHandler:Function = addAsync(handle_building_target_reached, 1000, handle_building_target_not_reached);
			
			eventDispatcher.addEventListener(ResourceBoundaryEvent.BOUNDARY_BREACHED, calendarHandler);
			eventDispatcher.addEventListener(ResourceBoundaryEvent.TARGET_REACHED, buildingHandler);
			
			var iLength:uint = 10;
			for (var i:int = 0; i < iLength; i++)
			{
				cycles++;
				processDayEndCommand.execute();
			}  
			
		}
		
		private function handle_calendar_boundary_breached(e:ResourceBoundaryEvent):void
		{
			try {
            	assertEquals("Game fails after 10 cycles", unwinnableGameConfig.calendarDays, cycles);
			}
			catch(assertionFailedError:AssertionFailedError) {
				getResult().addFailure(this, assertionFailedError);
			}
		}
		
		private function handle_building_target_reached(e:ResourceBoundaryEvent):void
		{
			try {
            	assertTrue("The target should never be reached", false);
			}
			catch(assertionFailedError:AssertionFailedError) {
				getResult().addFailure(this, assertionFailedError);
			}
		}
		
		private function handle_building_target_not_reached(e:Event):void
		{
			// all good
		}
		
		private function configureModels():void
		{
			processDayEndCommand.buildingProgress.eventDispatcher = eventDispatcher;
			processDayEndCommand.buildingProgress.max = unwinnableGameConfig.targetBuildTotal;
			processDayEndCommand.buildingProgress.currentValue = 0;

			processDayEndCommand.calendar.eventDispatcher = eventDispatcher;
			processDayEndCommand.calendar.currentValue = unwinnableGameConfig.calendarDays;
			processDayEndCommand.calendar.min = 0;  

			processDayEndCommand.labour.eventDispatcher = eventDispatcher;
			processDayEndCommand.labour.currentValue = unwinnableGameConfig.minimumTeamSize * unwinnableGameConfig.minimumWorkerProductivity; 
		}
		
	}
}