/* AS3
	Copyright 2009 Newloop.
*/
package com.newloop.util {
	 
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 *	Class description.
	 *
	 *	@langversion ActionScript 3.0
	 *	@playerversion Flash 9.0
	 *
	 *	@author Lindsey Fallow
	 *	@since  01.07.2009
	 */
	public class DisplayObjectExposer extends Object {
		
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	@Constructor
		 */
		public function DisplayObjectExposer(){
			trace("initialising: DisplayObjectExposer ");
			super();
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
        
		public static function exposeChildren(obj:DisplayObjectContainer, startTrace:String = "", recursionLevel:uint = 100, propsArray:Array = null):void{
			
			var nextTrace = startTrace + "     ";
			
			var iLength:uint = obj.numChildren;
			if(propsArray!=null){
				var jLength:uint = propsArray.length;
			}
			for (var i:uint = 0; i<iLength; i++){
				var nextObj:DisplayObject = obj.getChildAt(i);
				trace(startTrace + nextObj.toString());
				if(propsArray != null){
					var tracePropsArray:Array = [];					
					for (var j:uint = 0; j<jLength; j++){
					    var nextProperty:String = propsArray[j];
						if(nextObj.hasOwnProperty(nextProperty)){
							tracePropsArray.push(" " + nextProperty + ":" + nextObj[nextProperty]);
						} 
						
					}					
					trace(tracePropsArray);
					
				}
				
				if(recursionLevel>0){
					if(nextObj is DisplayObjectContainer){
						exposeChildren(nextObj as DisplayObjectContainer,nextTrace,recursionLevel-1, propsArray);
					}               
				}
			}
			
		}
		
		public static function exposeParents(obj:DisplayObject, startTrace:String = "", recursionLevel:uint = 100, propsArray:Array = null):void{
			
			var nextTrace = startTrace + "     ";
			
			trace(startTrace + obj.toString());
			
		    if(propsArray!=null){
				var jLength:uint = propsArray.length;
			}
			
			if(propsArray != null){
				var tracePropsArray:Array = [];					
				for (var j:uint = 0; j<jLength; j++){
				    var nextProperty:String = propsArray[j];
					if(obj.hasOwnProperty(nextProperty)){
						tracePropsArray.push(" " + nextProperty + ":" + obj[nextProperty]);
					} 
					
				}					
				trace(tracePropsArray);
			}
			
			if(recursionLevel>0){
				try{
					if(obj.parent){
						exposeParents(obj.parent as DisplayObject,nextTrace,recursionLevel-1, propsArray);
					}   
				
				} catch (e:Error){
					trace("CAUGHT SECURITY ERROR: " + e.message);
				}            
			} 
			
		}

		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------

		//--------------------------------------
		//  UNIT TESTS
		//--------------------------------------
		
	}
	
}
