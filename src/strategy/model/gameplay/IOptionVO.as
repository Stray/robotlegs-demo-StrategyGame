package strategy.model.gameplay {
		
	public interface IOptionVO {
		
		function get title():String;
		
		function get id():uint;
		
		function get consequences():Vector.<Class>;
		
	}
}
