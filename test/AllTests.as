package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
	import strategy.controller.events.MarketEventTest;
	import strategy.controller.events.ResourceBoundaryEventTest;
	import strategy.controller.events.ResourceStatusEventTest;
	import strategy.model.base.GameFactorModelTest;
	import strategy.model.base.MarketVariationModelTest;
	import strategy.model.markets.LabourAvailabilityMarketTest;
	import strategy.model.markets.LabourPriceMarketTest;
	import strategy.model.markets.StoneAvailabilityMarketTest;
	import strategy.model.markets.StonePriceMarketTest;
	import strategy.model.resources.BuildingProgressModelTest;
	import strategy.model.resources.CalendarModelTest;
	import strategy.model.resources.CashModelTest;
	import strategy.model.resources.EnvironmentalImpactModelTest;
	import strategy.model.resources.HealthAndSafetyModelTest;
	import strategy.model.resources.LabourModelTest;
	import strategy.model.resources.StoneSupplyModelTest;
	import strategy.model.resources.WorkerTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
			addTest(new strategy.controller.events.MarketEventTest());
			addTest(new strategy.controller.events.ResourceBoundaryEventTest());
			addTest(new strategy.controller.events.ResourceStatusEventTest());
			addTest(new strategy.model.base.GameFactorModelTest());
			addTest(new strategy.model.base.MarketVariationModelTest());
			addTest(new strategy.model.markets.LabourAvailabilityMarketTest());
			addTest(new strategy.model.markets.LabourPriceMarketTest());
			addTest(new strategy.model.markets.StoneAvailabilityMarketTest());
			addTest(new strategy.model.markets.StonePriceMarketTest());
			addTest(new strategy.model.resources.BuildingProgressModelTest());
			addTest(new strategy.model.resources.CalendarModelTest());
			addTest(new strategy.model.resources.CashModelTest());
			addTest(new strategy.model.resources.EnvironmentalImpactModelTest());
			addTest(new strategy.model.resources.HealthAndSafetyModelTest());
			addTest(new strategy.model.resources.LabourModelTest());
			addTest(new strategy.model.resources.StoneSupplyModelTest());
			addTest(new strategy.model.resources.WorkerTest());
		}
	}
}
