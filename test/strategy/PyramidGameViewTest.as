package strategy {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import strategy.view.decisions.StoneOfferView;
	import com.newloop.util.UnitHelpers;
	import flash.text.TextField;

	public class PyramidGameViewTest extends TestCase {
		private var instance:PyramidGameView;

		public function PyramidGameViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new PyramidGameView();
		}

		override protected function tearDown():void {
			super.tearDown();
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
		
		
	}
}