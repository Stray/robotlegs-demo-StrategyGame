package strategy.view.messages
{
	import strategy.view.messages.IGameMessageText;

	public class GameMessageText extends Object implements IGameMessageText
	{

		protected const CALENDAR_FAIL_MESSAGE:String = "The project ran out of time.";
		protected const CASH_FAIL_MESSAGE:String = "The project ran out of money.";
		protected const CASH_AND_CALENDAR_FAIL_MESSAGE:String = "The project ran out of money and time.";

	    //---------------------------------------
	    // IGameMessageText Implementation
	    //---------------------------------------

	    //import strategy.view.messages.IGameMessageText;
	    public function get calendarFailMessage():String
	    {
	    	return CALENDAR_FAIL_MESSAGE;
	    }

	    public function get cashFailMessage():String
	    {
	    	return CASH_FAIL_MESSAGE;
	    }

	    public function get cashAndCalendarFailMessage():String
	    {
	    	return CASH_AND_CALENDAR_FAIL_MESSAGE;
	    }
		
	}

    
}