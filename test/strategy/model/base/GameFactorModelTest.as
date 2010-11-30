package strategy.model.base {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import flash.events.EventDispatcher;

	public class GameFactorModelTest extends TestCase {
		private var instance:GameFactorModel;

		public function GameFactorModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GameFactorModel();
			instance.eventDispatcher = new EventDispatcher();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GameFactorModel", instance is GameFactorModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_set_max():void {
			instance.max =  100;
			assertEquals("Set max", 100 , instance.max);
		}
		
		public function test_set_min():void {
			instance.min =  20;
			assertEquals("Set min", 20 , instance.min);
		}
		
		public function test_set_currentValue():void {
			var currentValue:Number = 30;
			
			instance.currentValue =  currentValue;
			assertEquals("Set currentValue", currentValue , instance.currentValue);
		}

		public function test_history():void {
			var valuesVector:Vector.<Number> = new <Number>[10,20,30,20,50,80];
			
			var iLength:uint = valuesVector.length;
			for (var i:int = 0; i < iLength; i++)
			{
				instance.currentValue = valuesVector[i];
			}
			
			assertEqualsVectorsIgnoringOrder("History recorded correctly", valuesVector, instance.history);
		}
		
		public function test_set_currentPercentage():void {
			instance.min = 0;
			instance.max = 80;
			
			var percentage:Number = 75;
			instance.currentPercentage =  percentage;
			assertEquals("Set currentPercentage", percentage , instance.currentPercentage);
			assertEquals("Sets value", 60 , instance.currentValue);
		} 
		
		public function test_get_percentage():void {
		    instance.min = 0;
			instance.max = 60;
			instance.currentValue = 12;
			                             
		 	assertEquals("Get percentage", 20, instance.currentPercentage);
		}

		
		public function test_adjustByValue_correctly_adjusts_value():void {
			var startValue:Number = 40;
			var positiveAdjustment:Number = 3;
			var negativeAdjustment:Number = -8;
			
			instance.currentValue = startValue;
			instance.adjustByValue(positiveAdjustment);
			assertEquals("AdjustByValue positive", (startValue + positiveAdjustment), instance.currentValue);
			instance.adjustByValue(negativeAdjustment);
			assertEquals("AdjustByValue negative", (startValue + positiveAdjustment + negativeAdjustment), instance.currentValue);
		}
		
		public function test_adjustByPercentage_correctly_adjusts_value():void {
			var startValue:Number = 50;
			var positiveAdjustment:Number = 20;
			var negativeAdjustment:Number = -10;
			
			instance.currentValue = startValue;
			instance.adjustByPercentage(positiveAdjustment);
			assertEquals("AdjustByPercentage positive", 60, instance.currentValue);
			instance.adjustByPercentage(negativeAdjustment);
			assertEquals("AdjustByPercentage negative", 54, instance.currentValue);
		}
		
		
		
	}
}