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

	public class PyramidGameEndToEndTest extends TestCase {
		private var robotEyes:RobotEyes;

		public function  PyramidGameEndToEndTest (methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
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
			trace(progressStatusTextDriver);
			assertNotNull("Found the textfield", progressStatusTextDriver);
			assertTrue("Starting values on progress set to zero", progressStatusTextDriver.checkText('0'));
		}
		
		
		
	}
}