package strategy.model.resources {
		
	import strategy.model.base.IGameFactorModel;
	
	public interface IStoneSupplyModel extends IGameFactorModel {
	
		function get isInsured():Boolean;
		
		function set isInsured(value:Boolean):void;
				
	}
}