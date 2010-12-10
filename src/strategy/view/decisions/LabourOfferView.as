package strategy.view.decisions {
	
	import flash.display.Sprite;
	import strategy.model.transactions.WorkerProductivityVO;
	import org.osflash.signalsv1.Signal;
	import flash.events.MouseEvent;
	import flash.display.SimpleButton;
	import skins.PyramidGameSkin;
	import strategy.view.decisions.WorkerForHireView;
	
	public class LabourOfferView extends Sprite {
		
		protected const MAX_WORKERS:uint = 3;
		
		protected const WORKER_Y_POS:Number = 140;
		protected const WORKER_X_POSITIONS:Array = new Array(260, 415, 570);
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: LabourOfferViewMediator 
		 * 
		 */
		
		public function LabourOfferView(workersVector:Vector.<WorkerProductivityVO>) {			
			init();
			addWorkers(workersVector);
		}
		
		protected var _submitSignal:Signal;

		public function get submitSignal():Signal
		{
			return _submitSignal ||= new Signal();
		}
		
		protected function init():void
		{
			var skin:Sprite = new PyramidGameSkin.LabourOfferSkin() as Sprite;
			addChild(skin);
			
			var submitButton:SimpleButton = skin.getChildByName('submit_btn') as SimpleButton;
			submitButton.addEventListener(MouseEvent.CLICK, submitHandler);
		}
		
		protected function submitHandler(e:MouseEvent):void
		{
			submitSignal.dispatch();
		}
		
	    protected function addWorkers(workersVector:Vector.<WorkerProductivityVO>):void
   		{
	    	if(workersVector == null)
			{
				return;
			}   
			
			var workersToAdd:uint = Math.min(workersVector.length, MAX_WORKERS);
			       
			var iLength:uint = workersToAdd;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextWorker:WorkerForHireView = new WorkerForHireView(workersVector[i]);
				nextWorker.y = WORKER_Y_POS;
				nextWorker.x = WORKER_X_POSITIONS[i];
				addChild(nextWorker);
			}
		} 
	}
}