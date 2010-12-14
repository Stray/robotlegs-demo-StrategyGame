package strategy.controller.commands.daycycle{

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IBuildingProgressModel;
	import strategy.model.resources.ICalendarModel;
	import strategy.model.resources.ICashModel;
	import strategy.model.resources.ILabourModel;

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
	import flash.events.EventDispatcher;
	import strategy.controller.events.DailyProgressEvent;
	import strategy.model.resources.IStoneSupplyModel;

	public class ProcessDayEndCommandTest extends TestCase {
		private var instance:ProcessDayEndCommand;
		
		private const BLOCKS_BUILT:Number = 234;
		private const COST:Number = 3456;

		public function ProcessDayEndCommandTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(IBuildingProgressModel, ICashModel, ICalendarModel, ILabourModel, IStoneSupplyModel);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new ProcessDayEndCommand();
			instance.eventDispatcher = new EventDispatcher();
			instance.buildingProgress = nice(IBuildingProgressModel);
			instance.calendar = nice(ICalendarModel);
			instance.cash = nice(ICashModel);
			instance.labour = nice(ILabourModel);
			instance.stoneSupply = nice(IStoneSupplyModel);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is ProcessDayEndCommand", instance is ProcessDayEndCommand);
		}
		
		public function testIsCommand():void{
			assertTrue("instance is robotlegs Command", instance is Command);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
	    public function test_dispatches_progress_summary_event():void {
	    	stub(instance.labour).property("currentValue").returns(BLOCKS_BUILT);
			stub(instance.labour).property("teamCost").returns(COST);
	
			var handler:Function = addAsync(check_dispatches_progress_summary_event, 50);
	    	instance.eventDispatcher.addEventListener(DailyProgressEvent.PROGRESS_CALCULATED, handler);
	    	
	    	instance.execute();
	    }

	    private function check_dispatches_progress_summary_event(e:DailyProgressEvent):void {
	    	assertEquals('event is correct type', DailyProgressEvent.PROGRESS_CALCULATED, e.type);
	    	assertEquals('event carries correct block count', BLOCKS_BUILT, e.productivityVO.stonesBuilt);
	    	assertEquals('event carries correct cost', COST, e.productivityVO.wagesPaid);
	    }
		
	}
}