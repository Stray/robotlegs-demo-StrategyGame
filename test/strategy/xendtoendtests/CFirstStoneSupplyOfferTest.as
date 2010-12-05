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

	public class CFirstStoneSupplyOfferTest extends TestCase {
		public var robotEyes:RobotEyes;  
		
		public var config:IGameConfig;
		
		public var onTestComplete:Function;

		public function CFirstStoneSupplyOfferTest(methodName:String=null) {
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
			}
			catch(err:Error) {
				getResult().addFailure(this, new AssertionFailedError(err.message));
			} 
			assertNotNull("found the first offer screen", stoneScreenDriver);
		}
		
		
	}
}