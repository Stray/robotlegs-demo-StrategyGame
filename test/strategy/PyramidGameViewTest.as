package strategy {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import strategy.view.decisions.StoneOfferView;
	import com.newloop.util.UnitHelpers;
	import flash.text.TextField;
	import strategy.view.messages.DaySummaryView;
	import strategy.view.decisions.StoneDilemmaView;
	import strategy.view.decisions.NoStoneView;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.view.decisions.LabourOfferView;
	import strategy.view.decisions.WorkerForHireView;
	import strategy.view.messages.StoneStockCheckView;

	public class PyramidGameViewTest extends TestCase {
		private var instance:PyramidGameView;

		public function PyramidGameViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new PyramidGameView();
			addChild(instance);
		}

		override protected function tearDown():void {
			super.tearDown();
			removeChild(instance);
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is PyramidGameView", instance is PyramidGameView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_showStoneOffer_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var quantity:Number = 45;
			var price:Number = 13;
			instance.showStoneOffer(price, quantity);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite;
			assertTrue("Has added the correct type of view", topItem is StoneOfferView);
			var priceField:TextField = UnitHelpers.findNamedInstance(topItem, 'price_txt', 3);
			var availabilityField:TextField = UnitHelpers.findNamedInstance(topItem, 'availability_txt', 3);
			
			assertEquals("price passed correctly", price.toString() + " coins", priceField.text);
			assertEquals("quantity passed correctly", quantity.toString(), availabilityField.text);
		}
		
		public function test_removeStoneOffer_removes_from_screen_if_present():void {
			var quantity:Number = 45;
			var price:Number = 13;
			instance.showStoneOffer(price, quantity);
			instance.removeStoneOffer();
			assertFalse("no instance of StoneOfferView in the view", containsA(StoneOfferView));
		}
		
		public function test_removeStoneOffer_doesnt_error_if_not_present():void {
			instance.removeStoneOffer();
			assertTrue("RemoveStoneOffer doesn't error if it's not present", true);
		}
		
		public function test_showEndOfDaySummary_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var blocksBuilt:Number = 300;
			var wagesPaid:Number = 240; 
			instance.showEndOfDaySummary(blocksBuilt, wagesPaid);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite;
			assertTrue("Has added the correct type of view", topItem is DaySummaryView);
			var costField:TextField = UnitHelpers.findNamedInstance(topItem, 'cost_txt', 3);
			var quantityField:TextField = UnitHelpers.findNamedInstance(topItem, 'quantity_txt', 3);
			
			assertEquals("cost passed correctly", wagesPaid.toString() + " coins", costField.text);
			assertEquals("quantity passed correctly", blocksBuilt.toString(), quantityField.text);		
		}
		
		public function test_removeEndOfDaySummary_removes_from_screen_if_present():void {
			var blocksBuilt:Number = 300;
			var wagesPaid:Number = 240; 
			instance.showEndOfDaySummary(blocksBuilt, wagesPaid);
			instance.removeEndOfDaySummary();
			assertFalse("no instance of StoneOfferView in the view", containsA(DaySummaryView));
  		}
		
		
		private function containsA(needleClass:Class):Boolean
		{
			var iLength:uint = instance.numChildren;
			for (var i:int = 0; i < iLength; i++)
			{
				if(instance.getChildAt(i) is needleClass)
				{
					return true;
				}
			}
			
			return false;
		}
		
		public function test_showStoneDilemma_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var quantity:Number = 45;
			var price:Number = 13;
			var message:String = "Message text";
			instance.showStoneDilemma(price, quantity, message);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite;
			assertTrue("Has added the correct type of view", topItem is StoneDilemmaView);
			var priceField:TextField = UnitHelpers.findNamedInstance(topItem, 'price_txt', 3);
			var availabilityField:TextField = UnitHelpers.findNamedInstance(topItem, 'availability_txt', 3);
			var messageField:TextField = UnitHelpers.findNamedInstance(topItem, 'message_txt', 3);
			
			assertEquals("price passed correctly", price.toString() + " coins", priceField.text);
			assertEquals("quantity passed correctly", quantity.toString(), availabilityField.text);
			assertEquals("message passed correctly", message, messageField.text);
		}
		 
		public function test_removeStoneDilemma_removes_from_screen_if_present():void {
			var quantity:Number = 45;
			var price:Number = 13;
			var message:String = "Message text";
			instance.showStoneDilemma(price, quantity, message);
			instance.removeStoneOffer();
			assertFalse("no instance of StoneDilemmaView in the view", containsA(StoneDilemmaView));
		}
		
		public function test_showNoStoneOffer_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var message:String = "Message text";
			instance.showNoStoneOffer(message);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite;
			assertTrue("Has added the correct type of view", topItem is NoStoneView);
			var messageField:TextField = UnitHelpers.findNamedInstance(topItem, 'message_txt', 3);
			assertEquals("message passed correctly", message, messageField.text);
		}
		 
		public function test_removeNoStoneOffer_removes_from_screen_if_present():void {
			var message:String = "Message text";
			instance.showNoStoneOffer(message);
			instance.removeStoneOffer();
			assertFalse("no instance of NoStoneOfferView in the view", containsA(NoStoneView));
		}
		
		public function test_showLabourOffer_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var workers:Vector.<WorkerProductivityVO> = new Vector.<WorkerProductivityVO>();
			workers.push(new WorkerProductivityVO(100,100));
			instance.showLabourOffer(workers);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite; 
			assertTrue("Has added the correct type of view", topItem is LabourOfferView);
			assertEquals("Correct number of workers added", 1, UnitHelpers.countInstancesOf(topItem, WorkerForHireView));
		}
		
		public function test_removeLabourOffer_removes_from_screen_if_present():void {
			instance.showLabourOffer(null);
			instance.removeLabourOffer();
			assertFalse("no instance of LabourOfferView in the view", containsA(LabourOfferView));
		}
		
		public function test_showStoneStockCheck_adds_view_with_correct_values():void {
			var childrenBefore:uint = instance.numChildren;
			var quantity:Number = 99;
		    instance.showStoneStockCheck(quantity);
			assertEquals("Has added one more child", childrenBefore+1, instance.numChildren);
			var topItem:Sprite = instance.getChildAt(childrenBefore) as Sprite;
			assertTrue("Has added the correct type of view", topItem is StoneStockCheckView);
			var quantityField:TextField = UnitHelpers.findNamedInstance(topItem, 'quantity_txt', 3);
			assertEquals("quantity passed correctly", quantity.toString() + " stones", quantityField.text);
		}
		
	    public function test_removeStoneStockCheck_removes_from_screen_if_present():void {
			instance.showStoneStockCheck(1);
			instance.removeStoneStockCheck();
			assertFalse("no instance of StoneStockCheckView in the view", containsA(StoneStockCheckView));
		}  
	}
}