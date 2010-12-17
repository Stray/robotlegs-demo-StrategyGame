package strategy.model.gameplay
{
	import strategy.model.gameplay.dilemmas.DilemmaConfig;

	public class DilemmaOptionVO extends OptionVO
	{
	
		public function DilemmaOptionVO(id:uint, title:String, consequences:Vector.<Class>, payload:DilemmaConfig = null)
		{
			trace("DilemmaOptionVO::DilemmaOptionVO()", id, title, consequences, payload);
			super(id, title, consequences, payload);
		}
	
	} 

}