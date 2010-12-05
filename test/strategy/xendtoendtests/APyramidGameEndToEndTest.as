package strategy.xendtoendtests {

	import asunit.framework.TestCase;

	import flash.utils.Timer;
	
	import flash.events.TimerEvent;
	
	import com.newloop.roboteyes.core.RobotEyes;
	import strategy.model.IGameConfig;
	import strategy.model.FirstGameConfig;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	public class APyramidGameEndToEndTest extends TestCase {
		private var robotEyes:RobotEyes;                     
		private var config:IGameConfig;                      
		private var endToEndTests:Vector.<Class>;            
		private var runningEndToEndTests:Boolean;            
		private var dummyDispatcher:EventDispatcher = new EventDispatcher();

		public function  APyramidGameEndToEndTest (methodName:String=null) {
			super(methodName)
		}
 /*   	
		private function appendTests():void
		{
			endToEndTests = new Vector.<Class>();
			endToEndTests.push( StartingConditions );
			endToEndTests.push( FirstStoneSupplyOffer );
		}
   */
		override public function run():void{
            runningEndToEndTests = true;
			config = new FirstGameConfig();

			if(robotEyes==null){
				robotEyes = new RobotEyes(PyramidGame);
				addChild(robotEyes);
				robotEyes.visible = false;
			}

			//appendTests();

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
			//removeChild(robotEyes);
			//robotEyes = null;
		}
         
		public function test_confirm_app_is_up_and_running():void {
			assertTrue("Confirm app is up and running", robotEyes.testApplication is PyramidGame);
		}
		

		/*
		public function testEndToEnd():void {
			var handler:Function = addAsync(application_tests_complete, 20000);
			dummyDispatcher.addEventListener(Event.COMPLETE, handler);
			runNextEndToEndTest();
		} */
		
	    private function prepareTest(testClass:Class):TestCase {
			var nextTest:TestCase = new testClass() as TestCase;
			nextTest['onTestComplete'] = runNextEndToEndTest;
			nextTest['config'] = config;
			nextTest['robotEyes'] = robotEyes;
			return nextTest;
		}

		private function runNextEndToEndTest():void
		{
		    if(endToEndTests.length > 0)
			{
				var nextTest:TestCase = prepareTest(endToEndTests.shift());
				getResult().run(nextTest);
			}
			else
			{
				runningEndToEndTests = false;
				dummyDispatcher.dispatchEvent(new Event(Event.COMPLETE));
			}
		}

		private function application_tests_complete(e:Event = null):void
		{
		}
		
	}
}