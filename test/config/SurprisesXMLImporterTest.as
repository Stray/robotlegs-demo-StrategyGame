package config {

	import asunit.framework.TestCase;

	public class SurprisesXMLImporterTest extends TestCase {
		private var instance:SurprisesXMLImporter;

		public function SurprisesXMLImporterTest(methodName:String=null) {
			super(methodName);
		}

		override protected function setUp():void {
			super.setUp();
			instance = new SurprisesXMLImporter();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is SurprisesXMLImporter", instance is SurprisesXMLImporter);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_supplies_xml():void {
			assertTrue("Supplies xml", instance.surprisesXML != null);
		}
		
	}
}
