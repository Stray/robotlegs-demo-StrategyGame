package strategy.controller.surprises
{

	public interface IDilemmaSurpriseEventCaster extends ISurpriseEventCaster
	{
		function castAccidentWithPercentageProbability(probability:Number):void;
	}

}

