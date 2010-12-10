package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
//	import strategy.controller.commands.CheckStoneStockCommandTest;
//	import strategy.controller.commands.ConfigureModelsCommandTest;
//	import strategy.controller.commands.HireWorkersCommandTest;
//	import strategy.controller.commands.OfferLabourCommandTest;
//	import strategy.controller.commands.OfferStoneCommandTest;
//	import strategy.controller.commands.ProcessDayEndCommandTest;
//	import strategy.controller.commands.ProcessDayStartCommandTest;
//	import strategy.controller.commands.SkipHireWorkersCommandTest;
//	import strategy.controller.commands.StartViewCommandTest;
//	import strategy.controller.commands.TakeStoneDeliveryCommandTest;
//	import strategy.controller.events.DailyProgressEventTest;
//	import strategy.controller.events.DayCycleEventTest;
//	import strategy.controller.events.LabourSupplyEventTest;
//	import strategy.controller.events.ResourceBoundaryEventTest;
//	import strategy.controller.events.ResourceStatusEventTest;
//	import strategy.controller.events.StoneStockCheckEventTest;
//	import strategy.controller.events.StoneSupplyEventTest;
//	import strategy.controller.surprises.LabourSurpriseEventCasterTest;
//	import strategy.controller.surprises.StoneSurpriseEventCasterTest;
//	import strategy.model.base.GameFactorModelTest;
//	import strategy.model.base.MarketVariationModelTest;
//	import strategy.model.FirstGameConfigTest;
//	import strategy.model.markets.LabourAvailabilityMarketTest;
//	import strategy.model.markets.LabourPriceMarketTest;
//	import strategy.model.markets.StoneAvailabilityMarketTest;
//	import strategy.model.markets.StonePriceMarketTest;
//	import strategy.model.resources.BuildingProgressModelTest;
//	import strategy.model.resources.CalendarModelTest;
//	import strategy.model.resources.CashModelTest;
//	import strategy.model.resources.EnvironmentalImpactModelTest;
//	import strategy.model.resources.HealthAndSafetyModelTest;
//	import strategy.model.resources.LabourModelTest;
//	import strategy.model.resources.StoneSupplyModelTest;
//	import strategy.model.resources.WorkerTest;
//	import strategy.PyramidGameContextTest;
	import strategy.PyramidGameViewMediatorTest;
//	import strategy.PyramidGameViewTest;
//	import strategy.view.decisions.LabourOfferViewMediatorTest;
//	import strategy.view.decisions.LabourOfferViewTest;
//	import strategy.view.decisions.NoStoneViewMediatorTest;
//	import strategy.view.decisions.NoStoneViewTest;
//	import strategy.view.decisions.StoneDilemmaViewTest;
//	import strategy.view.decisions.StoneOfferViewMediatorTest;
//	import strategy.view.decisions.StoneOfferViewTest;
//	import strategy.view.decisions.WorkerForHireViewMediatorTest;
//	import strategy.view.decisions.WorkerForHireViewTest;
//	import strategy.view.messages.DaySummaryViewMediatorTest;
//	import strategy.view.messages.DaySummaryViewTest;
//	import strategy.view.messages.StoneStockCheckViewMediatorTest;
//	import strategy.view.messages.StoneStockCheckViewTest;
//	import strategy.view.status.CalendarStatusViewMediatorTest;
//	import strategy.view.status.CalendarStatusViewTest;
//	import strategy.view.status.CashStatusViewMediatorTest;
//	import strategy.view.status.CashStatusViewTest;
//	import strategy.view.status.EnvironmentStatusViewMediatorTest;
//	import strategy.view.status.EnvironmentStatusViewTest;
//	import strategy.view.status.ProgressStatusViewMediatorTest;
//	import strategy.view.status.ProgressStatusViewTest;
//	import strategy.view.status.SafetyStatusViewMediatorTest;
//	import strategy.view.status.SafetyStatusViewTest;
//	import strategy.view.status.StoneStockStatusViewMediatorTest;
//	import strategy.view.status.StoneStockStatusViewTest;
//	import strategy.view.status.TeamStatusViewMediatorTest;
//	import strategy.view.status.TeamStatusViewTest;
//	import strategy.view.WorkerViewTest;
//	import strategy.xendtoendtests.APyramidGameEndToEndTest;
//	import strategy.xendtoendtests.BStartingConditionsTest;
//	import strategy.xendtoendtests.CFirstDayTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
//			addTest(new strategy.controller.commands.CheckStoneStockCommandTest());
//			addTest(new strategy.controller.commands.ConfigureModelsCommandTest());
//			addTest(new strategy.controller.commands.HireWorkersCommandTest());
//			addTest(new strategy.controller.commands.OfferLabourCommandTest());
//			addTest(new strategy.controller.commands.OfferStoneCommandTest());
//			addTest(new strategy.controller.commands.ProcessDayEndCommandTest());
//			addTest(new strategy.controller.commands.ProcessDayStartCommandTest());
//			addTest(new strategy.controller.commands.SkipHireWorkersCommandTest());
//			addTest(new strategy.controller.commands.StartViewCommandTest());
//			addTest(new strategy.controller.commands.TakeStoneDeliveryCommandTest());
//			addTest(new strategy.controller.events.DailyProgressEventTest());
//			addTest(new strategy.controller.events.DayCycleEventTest());
//			addTest(new strategy.controller.events.LabourSupplyEventTest());
//			addTest(new strategy.controller.events.ResourceBoundaryEventTest());
//			addTest(new strategy.controller.events.ResourceStatusEventTest());
//			addTest(new strategy.controller.events.StoneStockCheckEventTest());
//			addTest(new strategy.controller.events.StoneSupplyEventTest());
//			addTest(new strategy.controller.surprises.LabourSurpriseEventCasterTest());
//			addTest(new strategy.controller.surprises.StoneSurpriseEventCasterTest());
//			addTest(new strategy.model.base.GameFactorModelTest());
//			addTest(new strategy.model.base.MarketVariationModelTest());
//			addTest(new strategy.model.FirstGameConfigTest());
//			addTest(new strategy.model.markets.LabourAvailabilityMarketTest());
//			addTest(new strategy.model.markets.LabourPriceMarketTest());
//			addTest(new strategy.model.markets.StoneAvailabilityMarketTest());
//			addTest(new strategy.model.markets.StonePriceMarketTest());
//			addTest(new strategy.model.resources.BuildingProgressModelTest());
//			addTest(new strategy.model.resources.CalendarModelTest());
//			addTest(new strategy.model.resources.CashModelTest());
//			addTest(new strategy.model.resources.EnvironmentalImpactModelTest());
//			addTest(new strategy.model.resources.HealthAndSafetyModelTest());
//			addTest(new strategy.model.resources.LabourModelTest());
//			addTest(new strategy.model.resources.StoneSupplyModelTest());
//			addTest(new strategy.model.resources.WorkerTest());
//			addTest(new strategy.PyramidGameContextTest());
			addTest(new strategy.PyramidGameViewMediatorTest());
//			addTest(new strategy.PyramidGameViewTest());
//			addTest(new strategy.view.decisions.LabourOfferViewMediatorTest());
//			addTest(new strategy.view.decisions.LabourOfferViewTest());
//			addTest(new strategy.view.decisions.NoStoneViewMediatorTest());
//			addTest(new strategy.view.decisions.NoStoneViewTest());
//			addTest(new strategy.view.decisions.StoneDilemmaViewTest());
//			addTest(new strategy.view.decisions.StoneOfferViewMediatorTest());
//			addTest(new strategy.view.decisions.StoneOfferViewTest());
//			addTest(new strategy.view.decisions.WorkerForHireViewMediatorTest());
//			addTest(new strategy.view.decisions.WorkerForHireViewTest());
//			addTest(new strategy.view.messages.DaySummaryViewMediatorTest());
//			addTest(new strategy.view.messages.DaySummaryViewTest());
//			addTest(new strategy.view.messages.StoneStockCheckViewMediatorTest());
//			addTest(new strategy.view.messages.StoneStockCheckViewTest());
//			addTest(new strategy.view.status.CalendarStatusViewMediatorTest());
//			addTest(new strategy.view.status.CalendarStatusViewTest());
//			addTest(new strategy.view.status.CashStatusViewMediatorTest());
//			addTest(new strategy.view.status.CashStatusViewTest());
//			addTest(new strategy.view.status.EnvironmentStatusViewMediatorTest());
//			addTest(new strategy.view.status.EnvironmentStatusViewTest());
//			addTest(new strategy.view.status.ProgressStatusViewMediatorTest());
//			addTest(new strategy.view.status.ProgressStatusViewTest());
//			addTest(new strategy.view.status.SafetyStatusViewMediatorTest());
//			addTest(new strategy.view.status.SafetyStatusViewTest());
//			addTest(new strategy.view.status.StoneStockStatusViewMediatorTest());
//			addTest(new strategy.view.status.StoneStockStatusViewTest());
//			addTest(new strategy.view.status.TeamStatusViewMediatorTest());
//			addTest(new strategy.view.status.TeamStatusViewTest());
//			addTest(new strategy.view.WorkerViewTest());
//			addTest(new strategy.xendtoendtests.APyramidGameEndToEndTest());
//			addTest(new strategy.xendtoendtests.BStartingConditionsTest());
//			addTest(new strategy.xendtoendtests.CFirstDayTest());
		}
	}
}
