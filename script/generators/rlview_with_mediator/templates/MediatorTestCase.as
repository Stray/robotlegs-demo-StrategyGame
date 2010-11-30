package <%= package_name %> {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Mediator;
	import flash.events.EventDispatcher;

	public class <%= class_name  %>MediatorTest extends TestCase {
		private var <%= instance_name %>Mediator:<%= class_name %>Mediator;

		public function <%= class_name %>MediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			<%= instance_name %>Mediator = new <%= class_name %>Mediator();
			<%= instance_name %>Mediator.view = new <%= class_name %>();
			<%= instance_name %>Mediator.eventDispatcher = new EventDispatcher();
			<%= instance_name %>Mediator.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			<%= instance_name %>Mediator = null;
		}

		public function testInstantiated():void {
			assertTrue("<%= instance_name %>Mediator is <%= class_name %>Mediator", <%= instance_name %>Mediator is <%= class_name %>Mediator);
		}
        
		public function testIsMediator():void{
			assertTrue("<%= instance_name %>Mediator is robotlegs Mediator", <%= instance_name %>Mediator is Mediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
	}
}