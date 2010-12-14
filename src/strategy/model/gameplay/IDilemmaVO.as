package strategy.model.gameplay {
		
	public interface IDilemmaVO {
		
		function get title():String;
		
		function get question():String;
		
		function get options():Vector.<IOptionVO>;
		
	}
}
