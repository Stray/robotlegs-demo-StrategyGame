package strategy.controller.commands.daycycle {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.controller.events.DilemmaEvent;
	import strategy.model.gameplay.dilemmas.WeekendWorkingDilemma;
	import strategy.model.gameplay.IDilemmaVO;
	import org.robotlegs.core.IOptionCommandMapper;

	import asunit.errors.AssertionFailedError;     

	import mockolate.prepare;
	import mockolate.nice;
	import mockolate.stub;
   	import mockolate.verify;
	import mockolate.errors.VerificationError;
	
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.object.strictlyEqualTo;
	import org.hamcrest.object.hasPropertyWithValue;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public class MapDilemmaConsequencesCommandTest extends TestCase {
		private var instance:MapDilemmaConsequencesCommand;
        private var dilemmaVO:IDilemmaVO;

		public function MapDilemmaConsequencesCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IOptionCommandMapper);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new MapDilemmaConsequencesCommand();
			dilemmaVO = new WeekendWorkingDilemma();
			instance.dilemmaEvent = new DilemmaEvent(DilemmaEvent.DILEMMA_PRESENTED, dilemmaVO);
			instance.optionCommandMapper = nice(IOptionCommandMapper);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is MapDilemmaConsequencesCommand", instance is MapDilemmaConsequencesCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_execute_mapsOptionConsequences_on_optionCommandMap():void {
			instance.execute();
			verify(instance.optionCommandMapper).method('mapDilemmaOptions').args(equalTo(dilemmaVO.options));
		}
	}
}