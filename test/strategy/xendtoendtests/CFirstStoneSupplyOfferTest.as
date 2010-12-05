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

	public class CFirstStoneSupplyOfferTest extends TestCase {
		
		private var expectedCost:Number;
		
		private const QUANTITY_TO_BUY:String = "100"; 
		
		private var config:IGameConfig;

		public function CFirstStoneSupplyOfferTest(methodName:String=null) {
			super(methodName)
		}
        
		override protected function setUp():void {
			config = new FirstGameConfig();
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
				expectedCost = Number(costDriver.textField.text);
				
				var submitButtonDriver:InteractiveObjectDriver = stoneScreenDriver.getAny(SimpleButton) as InteractiveObjectDriver;
				submitButtonDriver.click();
				
				addAsync(null, 1000, checkStatusUpdated); 
			}
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			} 
		}
		
		private function checkStatusUpdated(e:Event = null):void
		{
			try {
				var stoneStockStatusTextDriver:TextFieldDriver = inViewOf(StoneStockStatusView).getA(TextField).named('status_txt') as TextFieldDriver;
				assertTrue("Updated stone stock", stoneStockStatusTextDriver.checkText(QUANTITY_TO_BUY));

				var cashStatusTextDriver:TextFieldDriver = inViewOf(CashStatusView).getAny(TextField) as TextFieldDriver; 
				var expectedCash:Number = config.startingBudget - expectedCost;
				var cashText:String = expectedCash.toString();
				assertTrue("Updated money", cashStatusTextDriver.checkText(cashText));      
			}
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			}

		}
		
	}
}