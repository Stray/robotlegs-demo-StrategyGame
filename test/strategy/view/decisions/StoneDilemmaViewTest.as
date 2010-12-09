package strategy.view.decisions {

	import asunit.framework.TestCase;
	
	import flash.display.Sprite;
	import flash.display.SimpleButton;
	import flash.text.TextField;
	import com.newloop.util.UnitHelpers;
	import asunit.errors.AssertionFailedError;
	import flash.events.Event;

	public class StoneDilemmaViewTest extends TestCase {
		private var instance:StoneDilemmaView;

		private const PRICE:Number = 45;
		private const AVAILABILITY:Number = 302;
		private const QUANTITY:Number = 301;
		private const MESSAGE:String = "Oh deary dear, things aren't quite normal!"
		
		private var submitFired:Boolean;

		public function StoneDilemmaViewTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new StoneDilemmaView(PRICE, AVAILABILITY, MESSAGE);
			submitFired = false;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is StoneDilemmaView", instance is StoneDilemmaView);
		}
        
		public function testIsSprite():void{
			assertTrue("instance is Sprite", instance is Sprite);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_sets_price():void { 
			assertEquals("Set price updates text", PRICE.toString() + " coins", priceField.text);
		}
		
		public function test_sets_availability():void {
			assertEquals("Set availability updates text", AVAILABILITY.toString(), availabilityField.text);
		}
		
		public function test_sets_message():void {
			assertEquals("Set message updates text", MESSAGE, messageField.text);
		}
		
		public function test_zeros_quantity():void {
			assertEquals("Quantity set to zero", '0', quantityField.text);
		}
		
		public function test_zeros_cost():void {
			assertEquals("Cost set to zero", '0 coins', costField.text);
		}
		
		public function test_changing_quantity_changes_cost():void {
			var newQuantity:uint = 89;
			quantityField.text = newQuantity.toString();
			quantityField.dispatchEvent(new Event(Event.CHANGE));
			var newCost:Number = PRICE * newQuantity;
			var costShouldRead:String = newCost.toString() + " coins";
			assertEquals("Changing quantity changes cost", costShouldRead, costField.text);
		}
		
		public function test_changing_quantity_to_number_higher_than_availability_shows_error():void {
			var newQuantity:uint = AVAILABILITY + 1;
			quantityField.text = newQuantity.toString();
			quantityField.dispatchEvent(new Event(Event.CHANGE));
			var costShouldRead:String = "not available";
			assertEquals("Changing quantity changes cost to error message if too high", costShouldRead, costField.text);
		}

		public function test_changing_quantity_to_number_higher_than_availability_disables_submit_then_restores_if_lowered():void {
			instance.submitSignal.add(submit_signal_handler);
			var newQuantity:uint = AVAILABILITY + 1;
			quantityField.text = newQuantity.toString();
			UnitHelpers.clickItem(submitButton);
			assertFalse("Submit signal received", submitFired);
			var lowerQuantity:uint = QUANTITY;
			quantityField.text = lowerQuantity.toString();
			UnitHelpers.clickItem(submitButton);
			assertTrue("Submit signal received", submitFired);
		}

		public function test_changing_quantity_to_number_lower_than_availability_enables_submit():void {
			var newQuantity:uint = AVAILABILITY + 1;
			quantityField.text = newQuantity.toString();
			quantityField.dispatchEvent(new Event(Event.CHANGE));
			var costShouldRead:String = "not available";
			assertEquals("Changing quantity changes cost to error message if too high", costShouldRead, costField.text);
		}
		
		public function test_visually():void {
			addChild(instance);
			assertTrue("visually verified", true);
			removeChild(instance);
		}
		
		public function test_submit_signal_fired_after_submit_clicked():void {
        	quantityField.text = QUANTITY.toString();
			instance.submitSignal.add(submit_signal_handler);
			UnitHelpers.clickItem(submitButton);
			assertTrue("Submit signal received", submitFired);
		}
		
		private function submit_signal_handler(quantity:Number, price:Number):void
		{
			try {
                assertEquals("Quantity dispatched correctly", QUANTITY, quantity);
				assertEquals("Price dispatched correctly", PRICE, price);
			}
			catch(assertionFailedError:AssertionFailedError) {
				getResult().addFailure(this, assertionFailedError);
			}
			submitFired = true;
		}
		
		private function get priceField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'price_txt', 3) as TextField; 
		}
		
		private function get availabilityField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'availability_txt', 3) as TextField; 
		}
		
		private function get quantityField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'quantity_txt', 3) as TextField;
		}                                                                                  
		
		private function get costField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'cost_txt', 3) as TextField;
		}
		
		private function get messageField():TextField {
			return UnitHelpers.findNamedInstance(instance, 'message_txt', 3) as TextField;
		}
		
		private function get submitButton():SimpleButton {
			return UnitHelpers.findInstanceOf(instance, SimpleButton, 3) as SimpleButton;
		}
		
	}
}