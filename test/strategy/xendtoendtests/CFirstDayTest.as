package strategy.xendtoendtests {

	import asunit.framework.TestCase;
	
	import flash.display.DisplayObject;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	
	import flash.utils.Timer;
	
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.text.TextField;
	
	import com.newloop.roboteyes.inViewOf;
	import com.newloop.roboteyes.getA;
	import com.newloop.roboteyes.core.RobotEyes;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver; 
	import com.newloop.roboteyes.drivers.TextFieldDriver;
	import com.newloop.roboteyes.drivers.InteractiveObjectDriver;
	import strategy.view.status.ProgressStatusView;
	import strategy.model.IGameConfig;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.CashStatusView;
	import skins.PyramidGameSkin;
	import strategy.view.decisions.StoneOfferView;
	import asunit.errors.AssertionFailedError;
	import strategy.model.FirstGameConfig;
	import flash.display.SimpleButton;
	import strategy.view.messages.DaySummaryView;

	public class CFirstDayTest extends TestCase {
		
		private var stoneCost:Number;
		private var labourCost:Number;
		
		private var stonesBuilt:Number;
		
		private var config:IGameConfig = new FirstGameConfig();
		
		private const QUANTITY_TO_BUY:String = config.minimumStoneAvailability.toString(); 
		
		public function CFirstDayTest(methodName:String=null) {
			super(methodName)
		}
        
		override protected function setUp():void {
			super.setUp();
		}   
		
		override protected function tearDown():void {
			super.tearDown();
		}
		
		public function test_shows_normal_stone_delivery_option_screen():void {
			try {
            	var stoneScreenDriver:DisplayObjectDriver = getA(StoneOfferView);
				assertNotNull("found the first offer screen", stoneScreenDriver);

				var quantityDriver:TextFieldDriver = stoneScreenDriver.getA(TextField).named("quantity_txt") as TextFieldDriver;
				quantityDriver.enterText(QUANTITY_TO_BUY);
				
				var costDriver:TextFieldDriver = stoneScreenDriver.getA(TextField).named("cost_txt") as TextFieldDriver;
				stoneCost = Number(costDriver.textField.text.split(" ")[0]);
				
				var submitButtonDriver:InteractiveObjectDriver = stoneScreenDriver.getAny(SimpleButton) as InteractiveObjectDriver;
				submitButtonDriver.click();
				
				addAsync(null, 500, checkEndOfDaySummary);
			}   
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			} 
		}
		
		public function checkEndOfDaySummary(e:Event):void {
			try {
            	var daySummaryDriver:DisplayObjectDriver = getA(DaySummaryView);
				assertNotNull("found the first offer screen", daySummaryDriver);
				
				var quantityDriver:TextFieldDriver = daySummaryDriver.getA(TextField).named("quantity_txt") as TextFieldDriver;
				stonesBuilt = Number(quantityDriver.getText().split(" ")[0]);
				
				var costDriver:TextFieldDriver = daySummaryDriver.getA(TextField).named("cost_txt") as TextFieldDriver;
				labourCost = Number(costDriver.getText().split(" ")[0]);
				
				checkStatusUpdated();				
			}
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			} 
		}
		
		private function checkStatusUpdated(e:Event = null):void
		{
			try {
				var stoneStockStatusTextDriver:TextFieldDriver = inViewOf(StoneStockStatusView).getA(TextField).named('status_txt') as TextFieldDriver;
				var remainingStone:Number = Number(QUANTITY_TO_BUY) - stonesBuilt;
				assertTrue("Updated stone stock", stoneStockStatusTextDriver.checkText(remainingStone.toString()));

				var cashStatusTextDriver:TextFieldDriver = inViewOf(CashStatusView).getAny(TextField) as TextFieldDriver; 
				var expectedCash:Number = config.startingBudget - (stoneCost + labourCost); 
				var cashText:String = expectedCash.toString();
				assertTrue("Updated money", cashStatusTextDriver.checkText(cashText));      
			}
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			}

		}
		
	}
}