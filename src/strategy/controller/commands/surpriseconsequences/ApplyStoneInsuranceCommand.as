package strategy.controller.commands.surpriseconsequences 
{
	
	import org.robotlegs.mvcs.Command;
	import strategy.model.resources.IStoneSupplyModel;
	
	public class ApplyStoneInsuranceCommand extends Command
	{
		[Inject]
		public var stoneSupply:IStoneSupplyModel;
		
		override public function execute():void 
		{
			stoneSupply.isInsured = true;
		} 
	}
}