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
	import com.newloop.roboteyes.core.RobotEyes;
	import com.newloop.roboteyes.drivers.DisplayObjectDriver; 
	import com.newloop.roboteyes.drivers.TextFieldDriver;
	import com.newloop.roboteyes.drivers.InteractiveObjectDriver;
	import strategy.view.status.ProgressStatusView;
	import strategy.model.IGameConfig;
	import strategy.view.status.StoneStockStatusView;
	import strategy.model.FirstGameConfig;

	public class PyramidGameEndToEndTest extends TestCase {
		private var robotEyes:RobotEyes;  
		
		private var config:IGameConfig;

		public function  PyramidGameEndToEndTest (methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			config = new FirstGameConfig();

			if(robotEyes==null){
				robotEyes = new RobotEyes(PyramidGame);
				addChild(robotEyes);
				robotEyes.visible = false;
			}
			// need to wait a while
			var timer:Timer = new Timer(1000,1);
			timer.addEventListener(TimerEvent.TIMER, timerHandler);
			timer.start();
		}
		
		private function timerHandler(e:TimerEvent):void{
			robotEyes.visible = true;
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
		}   
		
		override protected function tearDown():void {
			super.tearDown();
		}
		
		override protected function cleanUp():void{
			removeChild(robotEyes);
			robotEyes = null;
		}

		public function testApplicationInitiated():void{
			assertTrue("Application or Module initiated ok", robotEyes.testApplication is PyramidGame);
		}
		
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
		
	}
}