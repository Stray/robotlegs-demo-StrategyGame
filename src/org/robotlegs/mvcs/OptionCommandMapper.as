package org.robotlegs.mvcs
{
	import org.robotlegs.core.IOptionCommandMap;
	import strategy.model.gameplay.IOptionVO;
	import org.robotlegs.core.IOptionCommandMapper;

	public class OptionCommandMapper implements IOptionCommandMapper
	{
	    
		protected var _optionCommandMap:IOptionCommandMap;
	    
	    [Inject]
		public function set optionCommandMap(value:IOptionCommandMap):void
		{
			_optionCommandMap = value;
		}; 
		
		public function get optionCommandMap():IOptionCommandMap
		{
			return _optionCommandMap;
		}   
    
		public function mapDilemmaOptions(options:Vector.<IOptionVO>):void
		{
   			for each (var option:IOptionVO in options)
			{
				var id:uint = option.id;
				for each (var consequenceCommand:Class in option.consequences)
				{
					_optionCommandMap.mapOption(id, consequenceCommand);
				}
			}
		} 
		
	   
	
	} 

}