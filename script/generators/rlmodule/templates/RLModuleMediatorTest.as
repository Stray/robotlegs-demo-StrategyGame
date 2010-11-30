package <%= package_name %> {

	import asunit.framework.TestCase;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	import flash.events.EventDispatcher;
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;
	import com.jpk.academy.modules.modulemanager.api.ExitEvent;

	public class <%= class_name %>MediatorTest extends TestCase {
		private var instance:<%= class_name %>Mediator;

		public function <%= class_name %>MediatorTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new <%= class_name %>Mediator();
			instance.eventDispatcher = new EventDispatcher();
			instance.moduleDispatcher = new ModuleEventDispatcher();
			instance.view = new <%= class_name %>();
			instance.onRegister();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is <%= class_name %>Mediator", instance is <%= class_name %>Mediator);
		}
		
		public function testIsModuleMediator():void{
			assertTrue("instance is ModuleMediator", instance is ModuleMediator);
		}

		public function testFailure():void {
			assertTrue("Failing test", false);
		}
		
		public function testRespondsToExitEvent():void{
			var handler:Function = addAsync(checkExitEventFiredCorrectly, 50);
			instance.moduleDispatcher.addEventListener(ExitEvent.READY_FOR_EXIT, handler);
			var evt:ExitEvent = new ExitEvent(ExitEvent.PREPARE_FOR_EXIT, null);
			instance.moduleDispatcher.dispatchEvent(evt);
		}
		
		private function checkExitEventFiredCorrectly(e:ExitEvent):void{
			assertTrue('event contains correct moduleContextView', e.moduleContextView == instance.view);
		}
	}
}