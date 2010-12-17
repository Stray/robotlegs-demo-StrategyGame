package config
{
	import flash.utils.ByteArray;
	import config.ISurprisesXMLImporter;

	public class SurprisesXMLImporter extends Object implements ISurprisesXMLImporter
	{
		[Embed(source='surprisesConfig.xml', mimeType="application/octet-stream")]
		protected static const SurprisesConfigXML:Class;
	    
	 	protected var _xml:XML;
	
		public function SurprisesXMLImporter()
		{
			super();
		}
	
		public function get surprisesXML():XML
		{
			return _xml ||= processXML();
		}   
		
		protected function processXML():XML
		{
			var file:ByteArray = new SurprisesConfigXML();
			var str:String = file.readUTFBytes( file.length );
			var xml:XML = new XML( str );
			return xml;
		}
	
	}

}