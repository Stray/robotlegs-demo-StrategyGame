package strategy.model.transactions
{

	public class DailyProductivityVO extends Object
	{
	
		public function DailyProductivityVO(stonesBuilt:Number, wagesPaid:Number)
		{
			_stonesBuilt = stonesBuilt;
			_wagesPaid = wagesPaid;
		}
		
		protected var _stonesBuilt:Number;

		public function get stonesBuilt():Number
		{
			return _stonesBuilt;
		}
		
		protected var _wagesPaid:Number;

		public function get wagesPaid():Number
		{
			return _wagesPaid;
		}
		
	
	}

}

