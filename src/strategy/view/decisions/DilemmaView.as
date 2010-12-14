package strategy.view.decisions {
	
	import flash.display.Sprite;
	import strategy.model.gameplay.IDilemmaVO;
	import flash.text.TextField;
	import org.osflash.signalsv1.Signal;
	import skins.PyramidGameSkin;
	import flash.utils.Dictionary;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import strategy.model.gameplay.IOptionVO;
	
	public class DilemmaView extends Sprite {
		
		protected var _submitSignal:Signal;
		protected var _clearSignal:Signal;
		
		protected var _skin:Sprite;
		
		protected var _idsByButton:Dictionary;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: DilemmaViewMediator 
		 * 
		 */
		
		public function DilemmaView(dilemmaVO:IDilemmaVO) {			
			init(PyramidGameSkin.DilemmaSkin, dilemmaVO);
		}
		
		public function get optionSubmittedSignal():Signal
		{
			return _submitSignal ||= new Signal(uint);
		}
		
		public function get clearSignal():Signal
		{
			return _clearSignal ||= new Signal(Sprite);
		}
		
		public function dispose():void
		{
			clearSignal.dispatch(this);
		}

		protected function setFieldValue(fieldName:String, value:String):void
		{
			var targetField:TextField = _skin.getChildByName(fieldName) as TextField;
			targetField.text = value;
			targetField.selectable = false;
			targetField.mouseEnabled = false;
		}
	
		protected function init(skinClass:Class, dilemmaVO:IDilemmaVO):void
		{
			_skin = new skinClass() as Sprite;
			addChild(_skin);
			
			setFieldValue('title_txt', dilemmaVO.title);
			setFieldValue('message_txt', dilemmaVO.question);
			
			configureButtons(dilemmaVO.options)
		}
	
		protected function configureButtons(options:Vector.<IOptionVO>):void
		{
			_idsByButton = new Dictionary();
			
			var btn1:SimpleButton = _skin.getChildByName("option_1_btn") as SimpleButton;
			var btn2:SimpleButton = _skin.getChildByName("option_2_btn") as SimpleButton;
			
			prepButton(btn1, options[0], 'label_1_txt');
			
			if(options.length>1)
			{
				prepButton(btn2, options[1], 'label_2_txt'); 
			}
			else
			{
				btn2.visible = false;
				setFieldValue('label_2_txt', ''); 
			}
		}   
		
		protected function prepButton(btn:SimpleButton, option:IOptionVO, labelFieldName:String):void
		{
			btn.addEventListener(MouseEvent.CLICK, submitClickedHandler);
			_idsByButton[btn] = option.id;
			setFieldValue(labelFieldName, option.title); 
		}
	
		protected function submitClickedHandler(e:MouseEvent):void
		{
			var optionID:uint = _idsByButton[e.target] as uint;
			optionSubmittedSignal.dispatch(optionID);
		} 
	}
}