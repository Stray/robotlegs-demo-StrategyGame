package strategy.view.logs {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;

	public class LineGraphTest extends TestCase {
		private var lineGraph:LineGraph;

		public function LineGraphTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();                               
			var dimensions:Rectangle = new Rectangle(0, 0, 600, 200);
    		lineGraph = new LineGraph(dimensions, 30, 100, 0xFF0000);
			lineGraph.x = 100;
			lineGraph.y = 300;
  		}

		override protected function tearDown():void {
			super.tearDown();
			lineGraph = null;
		}

		public function testInstantiated():void {
			assertTrue("lineGraph is LineGraph", lineGraph is LineGraph);
		}
        
		public function testIsSprite():void{
			assertTrue("lineGraph is Sprite", lineGraph is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		} 
		
		public function test_verified_visually():void {
			addChild(lineGraph); 
			lineGraph.addPoint(10);
			lineGraph.addPoint(25);
			lineGraph.addPoint(45);
			lineGraph.addPoint(32);
			lineGraph.addPoint(37);
			lineGraph.addPoint(29);
			lineGraph.addPoint(65);
			assertTrue("Verified visually", false);
		}
		
		
	}
}