package strategy.model.gameplay.dilemmas {

	import asunit.framework.TestCase;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;

	public class DilemmaConfigBuilderTest extends TestCase {
		private var instance:DilemmaConfigBuilder;

		public function DilemmaConfigBuilderTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DilemmaConfigBuilder();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DilemmaConfigBuilder", instance is DilemmaConfigBuilder);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_withoutAlteration_returns_config_with_all_values_zero():void { 

			var builtDilemma:DilemmaConfig = instance.build();
			
			assertEquals("WithoutAlteration returns config with all values zero: cash", 0, builtDilemma.cash);
			assertEquals("WithoutAlteration returns config with all values zero: days", 0, builtDilemma.days);
			assertEquals("WithoutAlteration returns config with all values zero: safety", 0, builtDilemma.safety);
			assertEquals("WithoutAlteration returns config with all values zero: environment", 0, builtDilemma.environment);
			assertEquals("WithoutAlteration returns config with all values zero: stone", 0, builtDilemma.stone);
			assertEquals("WithoutAlteration returns config with all values zero: stoneCapacity", 0, builtDilemma.stoneCapacity);
			assertEquals("WithoutAlteration returns config with all values zero: dailySafetyChange", 0, builtDilemma.dailySafetyChange);
			assertEquals("WithoutAlteration returns config with all values zero: dailyEnvironmentChange", 0, builtDilemma.dailyEnvironmentChange);
			assertEquals("WithoutAlteration returns config with all values zero: productivity", 0, builtDilemma.productivity);
			assertEquals("WithoutAlteration returns config with all values zero: progress", 0, builtDilemma.progress);
			assertEquals("WithoutAlteration returns config with all values zero: target", 0, builtDilemma.target);
		}
		
		public function test_with_cash_and_days():void {
			var cash:Number = 40;
			var days:Number = -3;
			var builtDilemma:DilemmaConfig = instance.withCash(cash)
													 .withDays(days)
													 .build();      
													
		    assertEquals("returns config with cash", cash, builtDilemma.cash);
		    assertEquals("returns config with days", days, builtDilemma.days);
		}
		
		public function test_with_safety_and_environment():void {
			var safety:Number = 40;
			var environment:Number = -3;
			var builtDilemma:DilemmaConfig = instance.withSafety(safety)
													 .withEnvironment(environment)
													 .build();      
													
			assertEquals("returns config with safety", safety, builtDilemma.safety);
			assertEquals("returns config with environment", environment, builtDilemma.environment);		
	   	}
	
		public function test_with_stone_and_stoneCapacity():void {
			var stone:Number = 40;
			var stoneCapacity:Number = -3;
			var builtDilemma:DilemmaConfig = instance.withStone(stone)
													 .withStoneCapacity(stoneCapacity)
													 .build();      

			assertEquals("returns config with stone", stone, builtDilemma.stone);
			assertEquals("returns config with stoneCapacity", stoneCapacity, builtDilemma.stoneCapacity);	    
	   	} 

		public function test_with_progress_and_productivity():void {
			var progress:Number = 40;
			var productivity:Number = -3; 
			var target:Number = 102;
			var builtDilemma:DilemmaConfig = instance.withProgress(progress)
													 .withProductivity(productivity)
													 .withTarget(target)
													 .build();      
													
		    assertEquals("returns config with progress", progress, builtDilemma.progress);
		    assertEquals("returns config with productivity", productivity, builtDilemma.productivity);
		    assertEquals("returns config with target", target, builtDilemma.target);
		}
 
		
	}
}