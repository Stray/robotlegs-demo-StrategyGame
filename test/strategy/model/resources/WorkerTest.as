package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class WorkerTest extends TestCase {
		private var instance:Worker;

		public function WorkerTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new Worker();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is Worker", instance is Worker);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_set_energyLevel():void {
			var energy:Number = 40;
			instance.energyLevel =  energy;
			assertEquals("Set energyLevel", energy , instance.energyLevel);
		}
		
		public function test_set_maxEnergyLevel():void {
			var maxEnergyLevel:Number = 66;
			instance.maxEnergyLevel =  maxEnergyLevel;
			assertEquals("Set maxEnergyLevel", maxEnergyLevel , instance.maxEnergyLevel);
		}
		
		public function test_adjustEnergyLevel_changes_energyLevel():void {
			instance.energyLevel = 100;
			var adjustment:Number = -10;
			instance.adjustEnergyLevel(adjustment);
			assertEquals("AdjustEnergyLevel changes energyLevel", 90, instance.energyLevel);
		}
		
	    public function test_move_takes_on_energyLevel():void {
	    	instance.min = 50;
			instance.max = 60;
			
			instance.energyLevel = 50;
			
			var minThreshold:Number = 25;
			var maxThreshold:Number = 30;
			
			var iLength:uint = 100;
			for (var i:int = 0; i < iLength; i++)
			{
				instance.move();
				assertTrue("stays within adjusted level min", minThreshold <= instance.currentValue);
				assertTrue("stays within adjusted level max", maxThreshold >= instance.currentValue);
			}
			
	    }
	
		public function test_suspendForDays_returns_0_productivity_for_x_days():void {
			var minValue:Number = 30;
			var maxValue:Number = 80;
			
			instance.energyLevel = 100;
			
			instance.min = minValue;
			instance.max = maxValue;
			
			assertTrue("stays within adjusted level min", minValue <= instance.currentValue);
			assertTrue("stays within adjusted level max", maxValue >= instance.currentValue);
			
			instance.suspendForDays(-2);
			assertEquals("suspended worker returns 0", 0, instance.currentValue);
			instance.move();
			assertEquals("suspended worker returns 0", 0, instance.currentValue);
			instance.move();

			assertTrue("stays within adjusted level min", minValue <= instance.currentValue);
			assertTrue("stays within adjusted level max", maxValue >= instance.currentValue);			
		}
		
	    
	}
}