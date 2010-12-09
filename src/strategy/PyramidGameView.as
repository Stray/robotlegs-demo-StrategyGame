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
	
	public class PyramidGameView extends Sprite {
		
		
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
		
		public function removeStoneOffer():void
		{
			removeAny(IStoneOfferView);
		}
		
		public function showEndOfDaySummary(blocksBuilt:Number, wagesPaid:Number):void
		{
			var daySummary:DaySummaryView = new DaySummaryView(blocksBuilt, wagesPaid);
			introduce(daySummary);
		}
		
		public function removeEndOfDaySummary():void {
			removeAny(DaySummaryView);
		}
		
		protected function introduce(viewItem:Sprite):void
		{
			viewItem.x = this.stage.width;
			addChild(viewItem);
			TweenLite.to(viewItem, 1, {x:0, ease:Quad.easeOut});
		}
		
		protected function init():void
		{
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
		}
		
		protected function removeAny(needleClass:Class):void
		{
			var iLength:uint = numChildren;
			for (var i:int = iLength-1; i >= 0; i--)
			{
				if(getChildAt(i) is needleClass)
				{
					removeChildAt(i);					
				}
			}
		}
		
		
	}
}