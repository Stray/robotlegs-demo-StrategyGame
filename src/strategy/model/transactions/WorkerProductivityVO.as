package strategy.model.transactions
{

public class WorkerProductivityVO extends DailyProductivityVO
{
	
	public function WorkerProductivityVO(stonesBuilt:Number, wagesPaid:Number)
	{
		super(stonesBuilt, wagesPaid);
	}
	
	public function toString():String
	{
		return ("[WorkerProductivityVO, stones:" + _stonesBuilt  + ", wages:" + _wagesPaid + "]")
	}
	
}

}

