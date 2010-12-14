package strategy.model.gameplay {
		
	import flash.display.Sprite;
	
	public interface IDilemmaVO {
		
		function get title():String;
		
		function get question():String;
		
		function get options():Vector.<IOptionVO>;
		
		function get image():Sprite;
	}
}