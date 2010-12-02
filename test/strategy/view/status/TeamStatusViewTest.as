package strategy.view.status {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;

	public class TeamStatusViewTest extends TestCase {
		private var instance:TeamStatusView;

		public function TeamStatusViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new TeamStatusView();
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is TeamStatusView", instance is TeamStatusView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_update_team_size():void {
			instance.updateTeamSize(1);
			assertEquals("Update team size shows correct number of workers", 1, visibleWorkersCount);          
			instance.updateTeamSize(4);
			assertEquals("Update team size shows correct number of workers", 4, visibleWorkersCount);
			instance.updateTeamSize(3);
			assertEquals("Update team size shows correct number of workers", 3, visibleWorkersCount);
			instance.updateTeamSize(2);
			assertEquals("Update team size shows correct number of workers", 2, visibleWorkersCount);
		} 
		
		private function get visibleWorkersCount():uint
		{
			var workerCount:uint = 0;
			
			var iLength:uint = skin.numChildren;
			for (var i:int = 0; i < iLength; i++)
			{
				if((skin.getChildAt(i).name != null) && (skin.getChildAt(i).name.indexOf("worker") == 0) && (skin.getChildAt(i).visible))
				{
					workerCount++;
				}
			}
			
			return workerCount;
		}
		
		private function get skin():Sprite
		{
			return instance.getChildAt(0) as Sprite;
		}
		
		
	}
}