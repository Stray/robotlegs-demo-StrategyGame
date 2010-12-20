package strategy {
	
	import flash.display.Sprite;
	import strategy.view.status.ProgressStatusView;
	import strategy.view.status.StoneStockStatusView;
	import strategy.view.status.CashStatusView;
	import strategy.view.status.TeamStatusView;
	import strategy.view.status.CalendarStatusView;
	import strategy.view.decisions.StoneOfferView;
	import strategy.view.messages.DaySummaryView;
	
	import gs.easing.Quad;
	import gs.TweenLite;
	import strategy.view.decisions.StoneDilemmaView;
	import strategy.view.decisions.NoStoneView;
	import strategy.view.decisions.IStoneOfferView;
	import strategy.model.transactions.WorkerProductivityVO;
	import strategy.view.decisions.LabourOfferView;
	import strategy.view.messages.StoneStockCheckView;
	import strategy.view.messages.GameOverView;
	import org.osflash.signalsv1.Signal;
	import strategy.view.messages.GameWonView;
	import strategy.view.decisions.DilemmaView;
	import strategy.model.gameplay.IDilemmaVO;
	import strategy.view.status.SafetyStatusView;
	import strategy.view.status.EnvironmentStatusView;
	import strategy.view.PyramidProgressView;
	
	public class PyramidGameView extends Sprite {
		
		protected var introduce:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: PyramidGameViewMediator 
		 * 
		 */
		
		public function PyramidGameView() {			
			init();
		}
		
		public function showStoneOffer(price:Number, quantity:Number):void
		{
			var stoneOffer:StoneOfferView = new StoneOfferView(price, quantity);
			introduce(stoneOffer);
		} 
		
		public function showStoneDilemma(price:Number, quantity:Number, message:String):void
		{
			var stoneOffer:StoneDilemmaView = new StoneDilemmaView(price, quantity, message);
			introduce(stoneOffer);
		}
		
		public function showNoStoneOffer(message:String):void
		{
			var stoneOffer:NoStoneView = new NoStoneView(message);
			introduce(stoneOffer);
		}
		
	    public function showEndOfDaySummary(blocksBuilt:Number, wagesPaid:Number):void
		{
			var daySummary:DaySummaryView = new DaySummaryView(blocksBuilt, wagesPaid);
			introduce(daySummary);
		}
		 
		public function showLabourOffer(workerVOs:Vector.<WorkerProductivityVO>):void
		{
			var labourOffer:LabourOfferView = new LabourOfferView(workerVOs);
			introduce(labourOffer);
		}
		
		public function showStoneStockCheck(quantity:Number, withInsurance:Boolean):void
		{
			var stoneStockCheck:StoneStockCheckView = new StoneStockCheckView(quantity, withInsurance);
			introduce(stoneStockCheck);
		}
		
		public function showGameOver(message:String):void
		{
			var gameOver:GameOverView = new GameOverView(message);
			introduce(gameOver);
			blockNewViewsUntil(gameOver.submitSignal);
		}
		
		public function showGameWon(days:uint, cash:Number):void
		{
			var gameWon:GameWonView = new GameWonView(days, cash);
			introduce(gameWon);
			blockNewViewsUntil(gameWon.submitSignal);
		}
		 
		public function showDilemma(dilemmaVO:IDilemmaVO):void
		{
			var dilemma:DilemmaView = new DilemmaView(dilemmaVO);
			introduce(dilemma);
			dilemma.clearSignal.add(clearHandler);
		}
		
		public function removeStoneOffer():void
		{
			removeAny(IStoneOfferView);
		}
		
		public function removeEndOfDaySummary():void
		{
			removeAny(DaySummaryView);
		}
		
		public function removeLabourOffer():void
		{
			removeAny(LabourOfferView);
		}
		
		public function removeStoneStockCheck():void
		{
			removeAny(StoneStockCheckView);
		}
		
		public function clearHandler(view:Sprite):void
		{
			if(contains(view))
			{
				removeChild(view);
			}
		}
				
		protected function introduceLive(viewItem:Sprite):void
		{
			viewItem.x = this.stage.width;
			addChild(viewItem);
			TweenLite.to(viewItem, 1, {x:0, ease:Quad.easeOut});
		}
		
		protected function introduceBlocked(viewItem:Sprite):void
		{
			// do nothing;
		}
		
		protected function blockNewViewsUntil(clearingSignal:Signal):void
		{
			introduce = introduceBlocked;
			clearingSignal.addOnce(clearingFunction);
		}
		
		protected function clearingFunction():void
		{
			introduce = introduceLive;
		}
		
		protected function init():void
		{
			var pyramidProgressView:Sprite = new PyramidProgressView();
			addChild(pyramidProgressView);
			
			var progressView:Sprite = new ProgressStatusView();
			addChild(progressView);
			
			var stoneStockView:Sprite = new StoneStockStatusView();
			addChild(stoneStockView);
			
			var cashStatusView:Sprite = new CashStatusView();
			addChild(cashStatusView);
			
			var teamStatusView:Sprite = new TeamStatusView();
			addChild(teamStatusView);
			
			var calendarStatusView:Sprite = new CalendarStatusView();
			addChild(calendarStatusView);
			
			var safetyStatusView:Sprite = new SafetyStatusView();
			addChild(safetyStatusView);
			
			var environmentStatusView:Sprite = new EnvironmentStatusView();
			addChild(environmentStatusView);
			
			introduce = introduceLive;
		}
		
		protected function removeAny(needleClass:Class):void
		{
			var iLength:uint = numChildren;
			for (var i:int = iLength-1; i >= 0; i--)
			{
				var nextItem:Sprite = getChildAt(i) as Sprite;
				if(nextItem is needleClass)
				{
					removeChildAt(i);
					return;
			    }
			}
		}
		
		
	}
}