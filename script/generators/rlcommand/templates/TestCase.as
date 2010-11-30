package <%= package_name %> {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;

	public class <%= test_case_name  %> extends TestCase {
		private var <%= instance_name %>:<%= class_name %>;

		public function <%= test_case_name %>(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			<%= instance_name %> = new <%= class_name %>();
		}

		override protected function tearDown():void {
			super.tearDown();
			<%= instance_name %> = null;
		}

		public function testInstantiated():void {
			assertTrue("<%= instance_name %> is <%= class_name %>", <%= instance_name %> is <%= class_name %>);
		}
		
		public function testIsCommand():void{
			assertTrue("<%= instance_name %> is robotlegs Command", <%= instance_name %> is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
		public function testExecute():void {
			assertTrue("Execute returns void", (<%= instance_name %>.execute() == void));
		}
	}
}