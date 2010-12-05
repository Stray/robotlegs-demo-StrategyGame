package strategy.xendtoendtests {

	import asunit.framework.TestCase;
	import flash.text.TextField;
	
	import com.newloop.roboteyes.inViewOf;
	import com.newloop.roboteyes.core.RobotEyes;
	import com.newloop.roboteyes.drivers.TextFieldDriver;
	import strategy.view.status.ProgressStatusView;
	import strategy.model.IGameConfig;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.CashStatusView;
	import strategy.view.status.TeamStatusView;
	import strategy.view.WorkerView;
	import strategy.view.status.CalendarStatusView;
	import strategy.model.FirstGameConfig;

	public class BStartingConditionsTest extends TestCase {
		//public var robotEyes:RobotEyes;  
		public var config:IGameConfig;
		//public var onTestComplete:Function;

		public function BStartingConditionsTest (methodName:String=null) {
			super(methodName)
		}
		
		override protected function setUp():void {
			config = new FirstGameConfig();
			super.setUp();
		}   
		
		override protected function tearDown():void {
			super.tearDown();
		}	
			
		/*override protected function cleanUp():void {
			super.cleanUp();
			//onTestComplete();
		} */
		
		public function test_starting_values_on_progress_set():void {
			var progressStatusTextDriver:TextFieldDriver = inViewOf(ProgressStatusView).getAny(TextField) as TextFieldDriver;
			assertTrue("Starting values on progress set to zero", progressStatusTextDriver.checkText('0'));
		}
		
		public function test_starting_values_on_stone_stock_set():void {
			var stoneStockStatusTextDriver:TextFieldDriver = inViewOf(StoneStockStatusView).getA(TextField).named('status_txt') as TextFieldDriver;
			assertTrue("Starting values on stone stock set to zero", stoneStockStatusTextDriver.checkText('0'));
		}
		
		public function test_starting_values_on_stone_capacity_set():void {
			var stoneStockCapacityTextDriver:TextFieldDriver = inViewOf(StoneStockStatusView).getA(TextField).named('capacity_txt') as TextFieldDriver;
			var capacityText:String = config.stoneStockCapacity.toString();
			assertTrue("Starting values on stone stock capacity set to config", stoneStockCapacityTextDriver.checkText(capacityText));
		}
		
		public function test_starting_values_on_cash_set():void {
			var cashStatusTextDriver:TextFieldDriver = inViewOf(CashStatusView).getAny(TextField) as TextFieldDriver; 
			var cashText:String = config.startingBudget.toString();
			assertTrue("Starting values on cash set to budget", cashStatusTextDriver.checkText(cashText));
		}
		
		public function test_team_initially_shows_correct_number_of_people():void {
			var workerCount:uint = inViewOf(TeamStatusView).getSome(WorkerView).countInstancesWithProperty('visible', true); 
			var requiredWorkerCount:uint = config.minimumTeamSize;
			assertEquals("Set the correct number of team members visible", requiredWorkerCount, workerCount);
		}
		
	    public function test_starting_values_on_calendar_set():void {
			var calendarStatusTextDriver:TextFieldDriver = inViewOf(CalendarStatusView).getAny(TextField) as TextFieldDriver;
			var daysRemaining:String = config.calendarDays.toString();
			assertTrue("Starting values on calendar set by config", calendarStatusTextDriver.checkText(daysRemaining));
		}
		
	}
}