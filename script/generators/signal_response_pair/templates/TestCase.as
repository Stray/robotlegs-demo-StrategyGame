package <%= package_name %> {

	import asunit.framework.TestCase;
	import org.osflash.signals.Signal;
	import org.osflash.signals.SyncSignalResponsePair;	

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
        
		public function testIsSyncSignalResponsePair():void{
			assertTrue("<%= instance_name %> is SyncSignalResponsePair", <%= instance_name %> is SyncSignalResponsePair);
		}
        
		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		        
		public function testValueClasses():void{
		   	assertEqualsArrays("<%= class_name %>.valueClasses has correct values", [Signal],<%= class_name %>.valueClasses);
		}
        
	}
}