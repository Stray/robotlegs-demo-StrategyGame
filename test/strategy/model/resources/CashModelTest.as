package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;

	public class CashModelTest extends TestCase {
		private var cashModel:CashModel;

		public function CashModelTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			cashModel = new CashModel();
		}

		override protected function tearDown():void {
			super.tearDown();
			cashModel = null;
		}

		public function testInstantiated():void {
			assertTrue("cashModel is CashModel", cashModel is CashModel);
		}
		
		public function testIsModel():void{
			assertTrue("cashModel is robotlegs Actor", cashModel is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}