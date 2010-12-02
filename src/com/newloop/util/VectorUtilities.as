package com.newloop.util {
		
	public class VectorUtilities {
		
		public static function vectorToArray(arg:*):Array
		{	
			var vec:Vector.<*>;
					                             
			if(arg is Vector.<*>)
			{   
				vec = arg;
			}
			else
			{
				vec = Vector.<*>(arg);
			}
			var returnArray:Array = vec.join().split(",");
		   
			return returnArray;
		}
		
		public static function equals(v1:*, v2:*):Boolean
		{
			if(bothNull(v1, v2))
			{
				return true;
			}
			
			if(eitherNull(v1, v2))
			{
				return false;
			}
			
			var vec1:Vector.<*> = Vector.<*>(v1);
			var vec2:Vector.<*> = Vector.<*>(v2);
			
			if(differentLengths(vec1, vec2))
			{
				return false;
			}
			
			var iLength:uint = vec1.length;
			for (var i:int = 0; i < iLength; i++)
			{
				if(vec1[i] != vec2[i])
				{
					return false;
				}
			}
			
			return true;
		}
		
		public static function equalsInAnyOrder(v1:*, v2:*):Boolean
		{
			if(bothNull(v1, v2))
			{
				return true;
			}
			
			if(eitherNull(v1, v2))
			{
				return false;
			}
			
			var vec1:Vector.<*> = Vector.<*>(v1);
			var vec2:Vector.<*> = Vector.<*>(v2);
			
			if(differentLengths(vec1, vec2))
			{
				return false;
			}
			
			var matchesVector:Vector.<*> = vec2.slice();
		    
			var iLength:uint = vec1.length;
			for (var i:int = 0; i < iLength; i++)
			{
				var searchItem:* = vec1[i];
				var matchingIndex:int = matchesVector.indexOf(searchItem);
				if(matchingIndex == -1)
				{
					return false;
				}
				
				matchesVector.splice(matchingIndex, 1);
			}
			
			return true;
		}
		
		public static function bothNull(v1:*, v2:*):Boolean
		{
			return ((v1==null)&&(v2==null));
		}
		
		public static function eitherNull(v1:*, v2:*):Boolean
		{
			return ((v1==null)||(v2==null));
		}
		
		public static function differentLengths(v1:Vector.<*>, v2:Vector.<*>):Boolean
		{
			return (v1.length != v2.length);
		}
		
	}
}