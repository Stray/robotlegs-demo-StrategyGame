package strategy.model.resources {

	import asunit.framework.TestCase;
	
	import org.robotlegs.mvcs.Actor;
	import strategy.controller.events.ResourceStatusEvent;
	import flash.events.EventDispatcher;
	import strategy.model.markets.ILabourPriceMarket;

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
	import strategy.model.transactions.WorkerProductivityVO;

	public class LabourModelTest extends TestCase {
		private var instance:LabourModel;
		private const NEW_TEAM_SIZE:uint = 5;

		public function LabourModelTest(methodName:String=null) {
			super(methodName)
		}

		override public function run():void{
			var mockolateMaker:IEventDispatcher = prepare(ILabourPriceMarket);
			mockolateMaker.addEventListener(Event.COMPLETE, prepareCompleteHandler);
		}

		private function prepareCompleteHandler(e:Event):void{
			IEventDispatcher(e.target).removeEventListener(Event.COMPLETE, prepareCompleteHandler);
			super.run();
		}

		override protected function setUp():void {
			super.setUp();
			instance = new LabourModel();
			instance.eventDispatcher = new EventDispatcher();
			instance.labourPriceMarket = nice(ILabourPriceMarket);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is LabourModel", instance is LabourModel);
		}
		
		public function testIsModel():void{
			assertTrue("instance is robotlegs Actor", instance is Actor);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_adjusting_team_size_fires_update_event():void {
			var handler:Function = addAsync(check_adjusting_team_size_fires_update_event, 50);
			instance.eventDispatcher.addEventListener(ResourceStatusEvent.TEAM_SIZE_UPDATED, handler);
			
			instance.teamSize = NEW_TEAM_SIZE;
		}

		private function check_adjusting_team_size_fires_update_event(e:ResourceStatusEvent):void {
			assertEquals('correct team size sent', NEW_TEAM_SIZE, e.value);
			
		}
		
		public function test_appendWorkers_changes_team_size():void { 
			var startTeamSize:uint = 3;
			instance.teamSize = startTeamSize;
			
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			workers.push(new WorkerProductivityVO(100, 200));
			workers.push(new WorkerProductivityVO(200, 300));
			
			instance.appendWorkers(workers);
			
            assertEquals("2 members added to team", startTeamSize+2, instance.teamSize);
		}
		
		public function test_removeTempWorkers_changes_team_size():void {
			var startTeamSize:uint = 3;
			instance.teamSize = startTeamSize;
			
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			workers.push(new WorkerProductivityVO(100, 200));
			workers.push(new WorkerProductivityVO(200, 300));
			
			instance.appendWorkers(workers);
			
			instance.removeTempWorkers();
			
			assertEquals("temps removed from team", startTeamSize, instance.teamSize);
		}
		
		
	}
}