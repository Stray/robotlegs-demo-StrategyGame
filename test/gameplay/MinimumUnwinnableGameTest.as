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
	import strategy.controller.commands.ConfigureModelsCommand;
	import strategy.model.resources.CashModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.markets.ILabourPriceMarket;
	import strategy.model.base.IMarketVariationModel;
	import strategy.model.markets.LabourPriceMarket;

	public class MinimumUnwinnableGameTest extends TestCase {
		private var eventDispatcher:IEventDispatcher; 
		
		private var cycles:uint = 0;
		
		private var gameConfig:IGameConfig;
		
		private var processDayEndCommand:ProcessDayEndCommand;
		
		private var buildingProgress:IBuildingProgressModel;
		private var calendar:ICalendarModel;
		private var labour:ILabourModel;
		private var cash:ICashModel;
		private var labourPriceMarket:ILabourPriceMarket;
		
		public function MinimumUnwinnableGameTest(methodName:String=null) {
			super(methodName);
		}

		override protected function setUp():void {
			super.setUp();
			
			eventDispatcher = new EventDispatcher();
			
			processDayEndCommand = new ProcessDayEndCommand();
			
			buildingProgress = new BuildingProgressModel();
			calendar = new CalendarModel(); 
			labour = new LabourModel();
			cash = new CashModel();
			labourPriceMarket = new LabourPriceMarket();
			                                                
			processDayEndCommand.buildingProgress = buildingProgress;
			processDayEndCommand.calendar = calendar; 
			processDayEndCommand.labour = labour;
			processDayEndCommand.cash = cash;   
			                     
		}

		override protected function tearDown():void {
			super.tearDown();
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_game_fails_after_10_cycles():void {
			
			gameConfig = new MinimumUnwinnableGameConfigSupport();
			configureModels(); 
			
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
		
		public function test_multiple_workers_build_more_blocks():void {
		   
			gameConfig = new MinimumUnwinnableGameConfigSupport();
			configureModels();
		 
			processDayEndCommand.execute();
			var buildingBlocksWithOneWorker:Number = buildingProgress.currentValue;
			buildingProgress.currentValue = 0;
			labour.teamSize = 3; 
			processDayEndCommand.execute();
			var buildingBlocksWith3Workers:Number = buildingProgress.currentValue;
			
			assertEquals("3 workers build 3 times as many blocks", buildingBlocksWithOneWorker*3, buildingBlocksWith3Workers);
		}

		public function test_cash_reduced_by_labour():void {
			
			gameConfig = new MinimumUnwinnableGameConfigSupport();
			configureModels();   
			
			labour.teamSize = 3;
			processDayEndCommand.execute();
			
			assertEquals("cash reduced by labour", (gameConfig.startingBudget - (3*((gameConfig.maximumLabourCost + gameConfig.minimumLabourCost)/2))), cash.currentValue);
		}
		
		private function handle_calendar_boundary_breached(e:ResourceBoundaryEvent):void
		{
			try {
            	assertEquals("Game fails after 10 cycles", gameConfig.calendarDays, cycles);
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
			buildingProgress.eventDispatcher = eventDispatcher;
			calendar.eventDispatcher = eventDispatcher;
			labour.eventDispatcher = eventDispatcher;
			cash.eventDispatcher = eventDispatcher;           
			
			labour.labourPriceMarket = labourPriceMarket;
			
			var configurationCommand:ConfigureModelsCommand = new ConfigureModelsCommand();
			configurationCommand.buildingProgress = buildingProgress;
			configurationCommand.calendar = calendar;
			configurationCommand.labour = labour;        
			configurationCommand.cash = cash;
			configurationCommand.labourPriceMarket = labourPriceMarket;
			configurationCommand.gameConfig = gameConfig; 
			
			configurationCommand.execute();
		    
		}
		
	}
}