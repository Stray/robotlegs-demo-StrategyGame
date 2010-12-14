package strategy.model.gameplay {

	import asunit.framework.TestCase;

	public class DilemmaVOTest extends TestCase {
		private var instance:DilemmaVO; 
		
		private const TITLE:String = "test title";
		private const QUESTION:String = "Test question";
		private const OPTIONS:Vector.<IOptionVO> = new Vector.<IOptionVO>();

		public function DilemmaVOTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new DilemmaVO(TITLE, QUESTION, OPTIONS);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is DilemmaVO", instance is DilemmaVO);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_title():void {
			assertEquals("Get title", TITLE, instance.title);
		}
		
		public function test_get_question():void {
			assertEquals("Get question", QUESTION, instance.question);
		}
		
		public function test_get_options():void {
			assertEquals("Get options", OPTIONS, instance.options);
		}
	}
}