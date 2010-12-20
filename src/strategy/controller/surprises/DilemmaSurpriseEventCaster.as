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
	import strategy.model.resources.IHealthAndSafetyModel;
	import strategy.model.resources.IEnvironmentalImpactModel;
	import flash.events.Event;
	import org.robotlegs.base.OptionEvent;
	
	public class DilemmaSurpriseEventCaster extends BaseSurpriseEventCaster implements IDilemmaSurpriseEventCaster {
		
		[Inject]
		public var surprisesXMLImporter:ISurprisesXMLImporter;
		
		[Inject]
		public var safety:IHealthAndSafetyModel;
		
		[Inject]
		public var environment:IEnvironmentalImpactModel;
		
		protected var _possibleEvents:Vector.<DilemmaEvent>;     
		protected var _eventsByCategory:Dictionary;
		protected var _dilemmaConfigBuilder:DilemmaConfigBuilder;
		protected var _queuedEvent:Event; 

		// classes intended just to ensure that dynamically grabbed classes are compiled
		private var importSurprisesSkin:SurprisesSkin;
		private var surprisesClassesImporter:SurprisesClassImporter;
		
		private const SAFETY:String = "safety";
		private const ENVIRONMENT:String = "environment";
		private const WEATHER:String = "weather"; 
		private const ASSESSMENT:String = 'assessment';
		private const OTHER:String = "other";
		private const NORMAL:String = "normal";
		
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
		
		public function castAccidentWithPercentageProbability(probability:Number):void
		{
			_queuedEvent = new DayCycleEvent(DayCycleEvent.RANDOM_EVENTS_COMPLETED);
			
			if(Math.random() < (probability/100))
			{
				_queuedEvent = takeRandomEventFrom(_eventsByCategory[SAFETY]);
			}
		   
			dispatchAfterOptionsCompleted();
		}                                
		
		protected function dispatchAfterOptionsCompleted():void
		{
			eventDispatcher.addEventListener(OptionEvent.OPTIONS_COMPLETED, optionsCompletedHandler);
		}
		
		protected function optionsCompletedHandler(e:OptionEvent):void
		{
			if(_queuedEvent != null)
			{
				dispatch(_queuedEvent);
				_queuedEvent = null;
			} 
			eventDispatcher.removeEventListener(OptionEvent.OPTIONS_COMPLETED, optionsCompletedHandler);
		}
		
		protected override function dispatchNormalEvent():void
		{
        	var evt:DayCycleEvent = new DayCycleEvent(DayCycleEvent.RANDOM_EVENTS_COMPLETED);
			dispatch(evt);
		}
		
		override protected function dispatchSurpriseEvent():void
		{
			var chosenEvent:DilemmaEvent = perhapsCreateSafetyEvent() 
			
			if(chosenEvent == null)
			{
				chosenEvent = perhapsCreateEnvironmentEvent();
			} 
			
			if(chosenEvent == null)
			{
				chosenEvent = perhapsCreateAssessmentEvent();
			} 
			
			if(chosenEvent == null)
			{
				chosenEvent = perhapsCreateWeatherEvent();
			}
			
			if(chosenEvent == null)
			{
				chosenEvent = createOtherEvent();
			}
			
			if(chosenEvent == null)
			{
				chosenEvent = createNormalEvent();
			}
			
			dispatch(chosenEvent);
		}
		
		protected function perhapsCreateSafetyEvent():DilemmaEvent
		{
			var chanceOfAnAccident:Number = (100 - safety.currentPercentage)/100;
			if(Math.random() < chanceOfAnAccident)
			{
				return takeRandomEventFrom(_eventsByCategory[SAFETY]);
			}
			return null;
		} 
		
		protected function takeRandomEventFrom(events:Vector.<DilemmaEvent>):DilemmaEvent
		{
			if(events.length == 0)
			{
				return null;
			}
			var randomIndex:uint = Math.floor(Math.random() * events.length);
			var chosenEvent:DilemmaEvent = events.splice(randomIndex,1)[0];
			return chosenEvent;
		}  
		
		protected function perhapsCreateEnvironmentEvent():DilemmaEvent
		{
			var chanceOfAProblem:Number = (100 - environment.currentPercentage)/100;
			if(Math.random() < chanceOfAProblem)
			{
				return takeRandomEventFrom(_eventsByCategory[ENVIRONMENT]);
			}
			return null;
		}
		
		protected function perhapsCreateAssessmentEvent():DilemmaEvent
		{
			var chanceOfAnAssessment:Number = 0.75;
			if(Math.random() < chanceOfAnAssessment)
			{
				return takeRandomEventFrom(_eventsByCategory[ASSESSMENT]);
			}
			return null;
		}   
		
		protected function perhapsCreateWeatherEvent():DilemmaEvent
		{
			var chanceOfBadWeather:Number = 0.2;
			if(Math.random() < chanceOfBadWeather)
			{
				return takeRandomEventFrom(_eventsByCategory[WEATHER]);
			}
			return null;
		}
		
		protected function createOtherEvent():DilemmaEvent
		{
			return takeRandomEventFrom(_eventsByCategory[OTHER]);
		}
		
		protected function createNormalEvent():DilemmaEvent
		{
			var randomIndex:uint = Math.floor(Math.random() * _eventsByCategory[NORMAL].length);
			var normalEvent:DilemmaEvent = _eventsByCategory[NORMAL][randomIndex];
			
			return normalEvent;
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

				var categoryEventSet:Vector.<DilemmaEvent> = (_eventsByCategory[dilemmaCategory] ||= new Vector.<DilemmaEvent>());
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