package strategy.model.base {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class MarketVariationModelTest extends TestCase {
		private var instance:MarketVariationModel; 
		

		public function MarketVariationModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new MarketVariationModel();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is MarketVariationModel", instance is MarketVariationModel);
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

		public function test_set_volatility():void {
			instance.volatility =  5;
			assertEquals("Set volatility", 5 , instance.volatility);
		}
		
		public function test_set_pointAverage():void {
			instance.pointAverage =  3;
			assertEquals("Set pointAverage", 3 , instance.pointAverage);
		}
		
		public function test_set_currentValue():void {
			instance.currentValue =  50;
			assertEquals("Set currentValue", 50 , instance.currentValue);
		}
		
		public function test_move():void {
			
			var minValue:Number = 20;
			var maxValue:Number = 100;
			var volatility:Number = 10;
			var pointAverage:Number = 3;
			var currentValue:Number = 50;
			
			instance.min = minValue;
			instance.max = maxValue;
			instance.volatility = volatility;
			instance.pointAverage = pointAverage;              
			instance.currentValue = currentValue;                 
			
			instance.move();
			assertTrue("Move generates new value", instance.currentValue != currentValue);
			assertTrue("New value is above min", instance.currentValue >= minValue);
			assertTrue("New value is below max", instance.currentValue <= maxValue);
			assertTrue("New value is within volatility of the current value", Math.abs(instance.currentValue - currentValue) <= volatility);
		}

		public function test_set_to_maximum():void {
			var maxValue:Number = 100;
			instance.max = maxValue;
			instance.setToMaximum();
			assertEquals("Set to maximum", maxValue, instance.currentValue);
		}
	   
	 	public function test_set_to_minimum():void { 
			var minValue:Number = 20;
			instance.min = minValue;
			instance.setToMinimum();
	 		assertEquals("Set to minimum", minValue, instance.currentValue);
	 	}
	
		public function test_set_to_midpoint():void { 
			var minValue:Number = 20;
			var maxValue:Number = 100;
			var midPoint:Number = (minValue + maxValue)/2;
			instance.min = minValue;
			instance.max = maxValue;
			instance.setToMidpoint();
	 		assertEquals("Set to midpoint", midPoint, instance.currentValue);
	 	}
	
		public function test_history():void { 
			
			var minValue:Number = 20;
			var maxValue:Number = 100;
			var volatility:Number = 10;
			var pointAverage:Number = 3;
			
			instance.min = minValue;
			instance.max = maxValue;
			instance.volatility = volatility;
			instance.pointAverage = pointAverage;              
			
			var historyVector:Vector.<Number> = new Vector.<Number>();
			instance.move();
			historyVector.push(instance.currentValue);
			instance.move();
			historyVector.push(instance.currentValue);
			instance.move();
			historyVector.push(instance.currentValue);
			
			assertEqualsVectorsIgnoringOrder("History", historyVector, instance.history);
		}
		
	 	public function test_100_entries_dont_break_the_rules():void {
	 		var minValue:Number = 20;
			var maxValue:Number = 100;
			var volatility:Number = 10;
			var pointAverage:Number = 3;
			
			instance.min = minValue;
			instance.max = maxValue;
			instance.volatility = volatility;
			instance.pointAverage = pointAverage;
			
			var iLength:uint = 100;
			for (var i:int = 0; i < iLength; i++)
			{
				var currentValue:Number = instance.currentValue; 
				//trace(currentValue);
				assertTrue("value above minimum", currentValue >= minValue);
				assertTrue("value below maximum", currentValue <= maxValue);
				instance.move();
			}
	 	}
	 	
		
	}
}