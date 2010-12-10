package strategy.view.messages
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	import org.osflash.signalsv1.Signal;

	public class BaseGameMessageView extends Sprite
	{
	    
		protected var _skin:Sprite;
		protected var _submitSignal:Signal;
	
		public function BaseGameMessageView()
		{
		}

	 	public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal();
		}

		protected function setFieldValue(fieldName:String, value:String):void
		{
			var targetField:TextField = _skin.getChildByName(fieldName) as TextField;
			targetField.text = value;
		}
	
		protected function init(skinClass:Class):void
		{
			_skin = new skinClass() as Sprite;
			addChild(_skin);
			configureSubmitButton();
		}
	
		protected function configureSubmitButton():void
		{
			var submitBtn:SimpleButton = _skin.getChildByName("submit_btn") as SimpleButton;
			submitBtn.addEventListener(MouseEvent.CLICK, submitClickedHandler);
		}
	
		protected function submitClickedHandler(e:MouseEvent):void
		{
			submitSignal.dispatch();
		}
	
	} 

}