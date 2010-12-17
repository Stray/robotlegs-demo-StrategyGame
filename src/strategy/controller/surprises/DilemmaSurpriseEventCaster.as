package strategy.controller.surprises {
	
	import strategy.controller.surprises.BaseSurpriseEventCaster;
	import strategy.controller.surprises.IDilemmaSurpriseEventCaster;
	import strategy.controller.events.DayCycleEvent;
	import strategy.controller.events.DilemmaEvent;
	import strategy.model.gameplay.IDilemmaVO;
	import strategy.model.gameplay.dilemmas.DilemmaConfigBuilder;
	import strategy.model.gameplay.IOptionVO;
	import strategy.model.gameplay.DilemmaVO;
	import flash.display.Sprite;
	import skins.SurprisesSkin;
	import strategy.controller.commands.surpriseconsequences.ContinueGameCommand;
	import strategy.model.gameplay.DilemmaOptionVO;
	import strategy.model.gameplay.dilemmas.DilemmaConfig;
	import flash.utils.getDefinitionByName;
	import config.ISurprisesXMLImporter;
	import flash.utils.Dictionary;
	
	public class DilemmaSurpriseEventCaster extends BaseSurpriseEventCaster implements IDilemmaSurpriseEventCaster {
		
		[Inject]
		public var surprisesXMLImporter:ISurprisesXMLImporter;
		
		protected var _possibleEvents:Vector.<DilemmaEvent>;     
		protected var _eventsByCategory:Dictionary;
		protected var _dilemmaConfigBuilder:DilemmaConfigBuilder;
		
		// classes intended just to ensure that dynamically grabbed classes are compiled
		private var importSurprisesSkin:SurprisesSkin;
		private var surprisesClassesImporter:SurprisesClassImporter;
		
		private const RESOURCES:String = "resources";
		private const SAFETY:String = "safety";
		private const ENVIRONMENT:String = "environment";
		private const WEATHER:String = "weather";
		private const OTHER:String = "other";
		
		protected const SURPRISES_PACKAGE:String = 'strategy.controller.commands.surpriseconsequences.';
		
		public function DilemmaSurpriseEventCaster() {
		} 
		
		public override function primeSurpriseEvents():void
		{
        	if(_possibleEvents != null)
			{
				return;
			}         
			createSurpriseEvents();
		}
		
		protected override function dispatchNormalEvent():void
		{
        	var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.RANDOM_EVENTS_COMPLETED);
			dispatch(evt);
		}
		
		override protected function dispatchSurpriseEvent():void
		{
			var eventIndex:uint = Math.floor(Math.random() * _possibleEvents.length);
			var chosenEvent:DilemmaEvent = _possibleEvents.splice(eventIndex, 1)[0];
			dispatch(chosenEvent);
		}
		
		protected function createSurpriseEvents():void
		{
			_possibleEvents = new Vector.<DilemmaEvent>();
			_eventsByCategory = new Dictionary();
			_dilemmaConfigBuilder = new DilemmaConfigBuilder();
			
			var surprisesXML:XML = surprisesXMLImporter.surprisesXML;
			
			for each (var dilemma:XML in surprisesXML.dilemma)
			{
				var nextDilemma:IDilemmaVO = processDilemmaXML(dilemma);
				var dilemmaEvent:DilemmaEvent = new DilemmaEvent(DilemmaEvent.DILEMMA_PRESENTED, nextDilemma);
				
				_possibleEvents.push(dilemmaEvent);
				
				var dilemmaCategory:String = this[dilemma.@category];

				var categoryEventSet:Array = (_eventsByCategory[dilemmaCategory] ||= new Array());
				categoryEventSet.push(dilemmaEvent);
			}
			
		}
		
		private function processDilemmaXML(dilemmaXML:XML):IDilemmaVO
		{
			var dilemmaTitle:String = dilemmaXML.title;
			var dilemmaMessage:String = dilemmaXML.message;
			var dilemmaImage:Sprite = new SurprisesSkin[dilemmaXML.imageClass.@className]() as Sprite;

			// we need to create an object to be able to pass by reference in to the createDilemmaConfig
			// function because primitive types are always passed by value, never by reference.
			var dilemmaMessageObject:Object = {msg:dilemmaMessage};
			var dilemmaConfig:DilemmaConfig = createDilemmaConfig(dilemmaXML.config, dilemmaMessageObject);

			var optionsVector:Vector.<IOptionVO> = createOptions(dilemmaXML.options.option, dilemmaConfig);
			
			var dilemmaVO:DilemmaVO = new DilemmaVO(dilemmaTitle, dilemmaMessageObject.msg, optionsVector, dilemmaImage);
			
			return dilemmaVO;
		}
		
	    private function createDilemmaConfig(configXML:XMLList, dilemmaMessageObject:Object):DilemmaConfig
		{			
			var configBuilder:DilemmaConfigBuilder = _dilemmaConfigBuilder;
			
			for each (var item:XML in configXML.item)
			{
				var value:Number = Number(item.@base) + Math.round((Math.random() * Number(item.@variance)));
				var id:String = item.@id;
				var idSub:String = "|"+id.toUpperCase() +"|";
				dilemmaMessageObject.msg = dilemmaMessageObject.msg.split(idSub).join(Math.abs(value).toString());
			
				configBuilder = configBuilder['with'+id](value);
			}
			return configBuilder.build();
		}
		
		private function createOptions(optionsXML:XMLList, dilemmaConfig:DilemmaConfig):Vector.<IOptionVO>
		{
			var optionsVector:Vector.<IOptionVO> = new Vector.<IOptionVO>();
			var optionIndex:uint = 0;
			
			for each (var option:XML in optionsXML)
			{
				optionIndex++;
				var optionTitle:String = option.@title;
				
				var consequenceClassNames:Array = option.@consequences.split("->");
				var optionConsequences:Vector.<Class> = new Vector.<Class>();
				
				var iLength:uint = consequenceClassNames.length;
				for (var i:int = 0; i < iLength; i++)
				{
					var consequenceClass:Class = getDefinitionByName(SURPRISES_PACKAGE + consequenceClassNames[i]) as Class;
					optionConsequences.push(consequenceClass);
				}
				
				var nextOption:IOptionVO = new DilemmaOptionVO(optionIndex, optionTitle, optionConsequences, dilemmaConfig);
				optionsVector.push(nextOption);
			}
			
			return optionsVector;
		}
		
	}
}