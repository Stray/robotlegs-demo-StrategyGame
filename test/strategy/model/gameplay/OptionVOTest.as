package strategy.model.gameplay {

	import asunit.framework.TestCase;

	public class OptionVOTest extends TestCase {
		private var instance:OptionVO;
         
		private const ID:uint = 3;                
		private const TITLE:String = "Test title";
		private const CONSEQUENCES:Vector.<Class> = new Vector.<Class>();

		public function OptionVOTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new OptionVO(ID, TITLE, CONSEQUENCES);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is OptionVO", instance is OptionVO);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_id():void {
			assertEquals("Get id", ID, instance.id);
		}
		
		public function test_get_title():void {
			assertEquals("Get title", TITLE, instance.title);
		}
		
		public function test_get_consequences():void {
			assertEquals("Get consequences", CONSEQUENCES, instance.consequences);
		}
		
	}
}