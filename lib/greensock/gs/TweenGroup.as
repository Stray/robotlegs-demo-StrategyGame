/*
VERSION: 1.1
DATE: 3/31/2009
ACTIONSCRIPT VERSION: 3.0 (AS2 version is also available)
UPDATES & MORE DETAILED DOCUMENTATION AT: http://blog.greensock.com/tweengroup/
DESCRIPTION:
	TweenGroup is a very powerful, flexible tool for managing groups of TweenLite/TweenMax tweens.
	Here are a few of the features:
		
		- pause(), resume(), reverse(), or restart() the group as a whole. This is an easy way to add
		  these capabilities to TweenLite instances without the extra Kb of TweenMax!
		  
		- Treat a TweenGroup instance just like an Array, so you can push(), splice(), unshift(), pop(),
		  slice(), shift(), loop through the elements, access them directly like myGroup[1], and set them directly 
		  like myGroup[2] = new TweenLite(mc, 1, {x:300}) and it'll automatically adjust the timing
		  of the tweens in the group to honor the alignment and staggering effects you set with 
		  the "align" and "stagger" properties (more on that next...)
		  
		- Easily set the alignment of the tweens inside the group, like:
				- myGroup.align = TweenGroup.ALIGN_SEQUENCE; //stacks them end-to-end, one after the other
				- myGroup.align = TweenGroup.ALIGN_START; //tweens will start at the same time
				- myGroup.align = TweenGroup.ALIGN_END; //tweens will end at the same time
				- myGroup.align = TweenGroup.ALIGN_INIT; //same as ALIGN_START except that it honors any delay set in each tween.
				- myGroup.align = TweenGroup.ALIGN_NONE; //no special alignment
				
		- Stagger aligned tweens by a set amount of time (in seconds). For example, if the stagger value is 0.5 and 
		  the align property is set to ALIGN_START, the second tween will start 0.5 seconds after the first one starts, 
		  then 0.5 seconds later the third one will start, etc. If the align property is ALIGN_SEQUENCE, there would 
		  be 0.5 seconds added between each tween.
		  
		- Have precise control over the progress of the group by getting/setting the "progress" property anytime. 
		  For example, to skip to half-way through the entire group of tweens, simply do this:
		  		myGroup.progress = 0.5
		  You can even tween the progress property with another tween to fastforward/rewind an entire group!
		
		- Call any function when the TweenGroup completes using the onComplete property, and pass any number of
		  parameters to that function using the onCompleteParams property. The AS3 version even dispatches
		  a COMPLETE event when it finishes, so if you prefer to use addEventListener() instead of the callback, you can.
		
		- Loop or yoyo a set amount of times or inifinitely. For example, to have your TweenGroup yoyo (reverse() when
		  it has completed) 2 times, just do myGroup.yoyo = 2; (to loop twice instead, do myGroup.loop = 2)
		  
		- Only adds about 4Kb to your SWF (not including TweenLite and OverwriteManager).
		
	At first glance, it may be difficult to see the value of using TweenGroup, but once you wrap your head around
	it, you'll probably find all kinds of uses for it and wonder how you lived without it. For example, what if you 
	have a menu that flies out and unfolds using several sequenced tweens but when the user clicks elsewhere, you 
	want the menu to fold back into place. With TweenGroup, it's as simple as calling myGroup.reverse(). Or if you
	have a bunch of tweens that play and then you want to loop them back to the beginning, just call myGroup.restart()
	or set myGroup.progress = 0. 
	

METHODS:
	- pause():void
	- resume():void
	- restart(includeDelay:Boolean):void
	- reverse(forcePlay:Boolean):void
	- getActive():Array
	- mergeGroup(group:TweenGroup, startIndex:Number):void
	- updateTimeSpan():void
	- clear(killTweens:Boolean):void
	(also any EventDispatcher methods like addEventListener(), etc.)
	
STATIC METHODS:
	- allTo(targets:Array, duration:Number, vars:Object, BaseTweenClass:Class):TweenGroup
	- allFrom(targets:Array, duration:Number, vars:Object, BaseTweenClass:Class):TweenGroup
	- parse(tweens:Array, BaseTweenClass:Class):Array

PROPERTIES:
	- length : uint
	- progress : Number	
	- progressWithDelay : Number
	- paused : Boolean
	- reversed : Boolean
	- duration : Number [read-only]
	- durationWithDelay : Number [read-only]
	- align : String
	- stagger : Number
	- onComplete : Function
	- onCompleteParams : Array
	- loop : Number
	- yoyo : Number
	- tweens : Array
	- timeScale : Number  (only affects TweenMax instances)
	

EXAMPLES: 
	
	To set up a simple sequence of 3 tweens that should be sequenced one after the other:
		
		import gs.*;
		
		var tween1:TweenLite = new TweenLite(mc, 1, {x:300});
		var tween2:TweenLite = new TweenLite(mc, 3, {y:400});
		var tween3:TweenMax = new TweenMax(mc, 2, {blurFilter:{blurX:10, blurY:10}});
		
		var myGroup:TweenGroup = new TweenGroup([tween1, tween2, tween3]);
		myGroup.align = TweenGroup.ALIGN_SEQUENCE;
		
		
	Or if you don't mind all your tweens being the same type (TweenMax in this case as opposed to TweenLite), 
	you can do the same thing in less code like this:
	
		var myGroup:TweenGroup = new TweenGroup([{target:mc, time:1, x:300}, {target:mc, time:3, y:400}, {target:mc, time:2, blurFilter:{blurX:10, blurY:10}}], TweenMax, TweenGroup.ALIGN_SEQUENCE);
	
	
	If you have an existing TweenGroup that you'd like to splice() a new tween into, it's as simple as:
		
		myGroup.splice(2, 0, new TweenLite(mc, 3, {alpha:0.5}));
	
	
	To pause the group and skip to half-way through the overall progress, do:
		
		myGroup.pause();
		myGroup.progress = 0.5;
	

NOTES:
	- This class adds about 4kb to your SWF (in addition to TweenLite and OverwriteManager which are about 4kb combined)
	- The TweenMax.sequence(), TweenMax.multiSequence(), TweenMax.allTo(), and TweenMax.allFrom() methods have been deprecated in favor of
	  using TweenGroup because it is far more powerful and flexible. 
	- When you remove a tween from a group or replace it, that tween does NOT get killed automatically.
	  It will continue to run, so you need to use TweenLite.removeTween() to kill it.
	- If you're running into problems with tweens simply not playing, it may be an overwriting issue. 
	  Check out http://blog.greensock.com/overwritemanager/ for help.
	- This is a brand new class, so please check back regularly for updates and let me know if
	  you run into any bugs/problems.
	  

AUTHOR: Jack Doyle, jack@greensock.com
Copyright 2009, GreenSock. All rights reserved. This work is subject to the terms in http://www.greensock.com/terms_of_use.html or for corporate Club GreenSock members, the software agreement that was issued with the corporate membership.
*/

package gs {
	import flash.events.*;
	import flash.utils.*;

	dynamic public class TweenGroup extends Proxy implements IEventDispatcher {
		public static const version:Number = 1.1;
		public static const ALIGN_INIT:String = "init";
		public static const ALIGN_START:String = "start";
		public static const ALIGN_END:String = "end";
		public static const ALIGN_SEQUENCE:String = "sequence";
		public static const ALIGN_NONE:String = "none";
		
		protected static var _overwriteMode:int = (OverwriteManager.enabled) ? OverwriteManager.mode : OverwriteManager.init(); //forces OverwriteManager to init() in AUTO mode (if it's not already initted) because AUTO overwriting is much more intuitive when working with sequences and groups. If you prefer to manage overwriting manually to save the 1kb, just comment this line out.
		protected static var _TweenMax:Class;
		protected static var _classInitted:Boolean;
		protected static var _unexpired:Array = []; //TweenGroups that have not ended/expired yet (have endTimes in the future)
		protected static var _prevTime:uint = 0; // records TweenLite.currentTime so that we can compare it on the checkExpiration() function to see if/when TweenGroups have completed.
		
		public var onComplete:Function;
		public var onCompleteParams:Array;
		public var loop:Number;
		public var yoyo:Number;
		public var endTime:Number; //time at which the last tween finishes (made it public for speed purposes)
		public var expired:Boolean;
		
		protected var _tweens:Array;
		protected var _pauseTime:Number;
		protected var _startTime:Number; //time at which the first tween in the group begins (AFTER any delay)
		protected var _initTime:Number; //same as _startTime except it factors in the delay, so it's basically _startTime minus the first tween's delay.
		protected var _reversed:Boolean;
		protected var _align:String;
		protected var _stagger:Number; //time (in seconds) to stagger each tween in the group/sequence
		protected var _repeatCount:Number; //number of times the group has yoyo'd or loop'd.
		protected var _dispatcher:EventDispatcher;
		
		/**
		 * Constructor 
		 * 
		 * @param $tweens An Array of either TweenLite/TweenMax instances or Objects each containing at least a "target" and "time" property, like [{target:mc, time:2, x:300},{target:mc2, time:1, alpha:0.5}]
		 * @param $DefaultTweenClass Defines which tween class should be used when parsing objects that are not already TweenLite/TweenMax instances. Choices are TweenLite or TweenMax.
		 * @param $align Controls the alignment of the tweens within the group. Options are TweenGroup.ALIGN_SEQUENCE, TweenGroup.ALIGN_START, TweenGroup.ALIGN_END, TweenGroup.ALIGN_INIT, or TweenGroup.ALIGN_NONE
		 * @param $stagger Amount of time (in seconds) to offset each tween according to the current alignment. For example, if the align property is set to ALIGN_SEQUENCE and stagger is 0.5, this adds 0.5 seconds between each tween in the sequence. If align is set to ALIGN_START, it would add 0.5 seconds to the start time of each tween (0 for the first tween, 0.5 for the second, 1 for the third, etc.)
		 * */
		public function TweenGroup($tweens:Array=null, $DefaultTweenClass:Class=null, $align:String="none", $stagger:Number=0) {
			super();
			if (!_classInitted) {
				if (TweenLite.version < 10.092) {
					trace("TweenGroup error! Please update your TweenLite class or try deleting your ASO files. TweenGroup requires a more recent version. Download updates at http://www.TweenLite.com.");
				}
				try {
					_TweenMax = (getDefinitionByName("gs.TweenMax") as Class); //Checking "if (tween is _TweenMax)" is twice as fast as "if (tween.hasOwnProperty("paused"))". Storing a reference to the class this way prevents us from having to import the whole TweenMax class, thus saves a lot of Kb.
				} catch ($e:Error) {
					_TweenMax = Array;
				}
				TweenLite.timingSprite.addEventListener(Event.ENTER_FRAME, checkExpiration, false, -1, true);
				_classInitted = true;
			}
			this.expired = true;
			_repeatCount = 0;
			_align = $align;
			_stagger = $stagger;
			_dispatcher = new EventDispatcher(this);
			if ($tweens != null) {
				_tweens = parse($tweens, $DefaultTweenClass);
				updateTimeSpan();
				realign();
			} else {
				_tweens = [];
				_initTime = _startTime = this.endTime = 0;
			}
		}
		
		
//---- PROXY FUNCTIONS ------------------------------------------------------------------------------------------
				
		flash_proxy override function callProperty($name:*, ...$args:Array):* {
			var returnValue:* = _tweens[$name].apply(null, $args);
			realign();
			if (!isNaN(_pauseTime)) {
				pause(); //in case any tweens were added that weren't paused!
			}
			return returnValue;
		}
		
		flash_proxy override function getProperty($prop:*):* {
			return _tweens[$prop];
		}
		
		flash_proxy override function setProperty($prop:*, $value:*):void {
			onSetProperty($prop, $value);
		}
		
		protected function onSetProperty($prop:*, $value:*):void {
			if (!isNaN($prop) && !($value is TweenLite)) {
				trace("TweenGroup error: an attempt was made to add a non-TweenLite element.");
			} else {
				_tweens[$prop] = $value;
				realign();
				if (!isNaN(_pauseTime) && ($value is TweenLite)) {
					pauseTween($value as TweenLite);
				}
			}
		}
		
		flash_proxy override function hasProperty($name:*):Boolean {
			var props:String = " progress progressWithDelay duration durationWithDelay paused reversed timeScale align stagger tweens ";
			if (_tweens.hasOwnProperty($name)) {
				return true;
			} else if (props.indexOf(" " + $name + " ") != -1) {
				return true;
			} else {
				return false;
			}
		}
		
//---- EVENT DISPATCHING FUNCTIONS -----------------------------------------------------------------------------
		
		public function addEventListener($type:String, $listener:Function, $useCapture:Boolean = false, $priority:int = 0, $useWeakReference:Boolean = false):void {
			_dispatcher.addEventListener($type, $listener, $useCapture, $priority, $useWeakReference);
		}
		
		public function removeEventListener($type:String, $listener:Function, $useCapture:Boolean = false):void {
			_dispatcher.removeEventListener($type, $listener, $useCapture);
		}
		
		public function hasEventListener($type:String):Boolean {
			return _dispatcher.hasEventListener($type);
		}
		
		public function willTrigger($type:String):Boolean {
			return _dispatcher.willTrigger($type);
		}
		
		public function dispatchEvent($e:Event):Boolean {
			return _dispatcher.dispatchEvent($e);
		}
		
		
//---- PUBLIC FUNCTIONS ----------------------------------------------------------------------------------------
		
		/**
		 * Pauses the entire group of tweens
		 */
		public function pause():void {
			if (isNaN(_pauseTime)) {
				_pauseTime = TweenLite.currentTime;
			}
			for (var i:int = _tweens.length - 1; i > -1; i--) { //this is outside the if() statement in case one (or more) tween is independently resumed() while the group is paused, and then the user wants to make sure all tweens in the group are paused.
				if (_tweens[i].startTime != 999999999999999) {
					pauseTween(_tweens[i]);
				}
			}
		}
		
		/**
		 * Resumes the entire group of tweens
		 */
		public function resume():void {
			var a:Array = [], i:int, time:Number = TweenLite.currentTime;
			for (i = _tweens.length - 1; i > -1; i--) {
				if (_tweens[i].startTime == 999999999999999) {
					resumeTween(_tweens[i]);
					a[a.length] = _tweens[i];
				}
				if (_tweens[i].startTime >= time && !_tweens[i].enabled) {
					_tweens[i].enabled = true;
					_tweens[i].active = false;
				}
			}
			if (!isNaN(_pauseTime)) {
				var offset:Number = (TweenLite.currentTime - _pauseTime) / 1000;
				_pauseTime = NaN;
				offsetTime(a, offset);
			}
		}
		
		/**
		 * Restarts the entire group of tweens, optionally including any delay from the first tween.
		 *  
		 * @param $includeDelay If true, any delay from the first tween (chronologically) is taken into account. 
		 */
		public function restart($includeDelay:Boolean=false):void {
			setProgress(0, $includeDelay);
			_repeatCount = 0;
			resume();
		}
		
		/**
		 * Reverses the entire group of tweens so that they appear to run backwards. If the group of tweens is partially finished when reverse() 
		 * is called, the timing is automatically adjusted so that no skips/jumps occur. For example, if the entire group of tweens would take 
		 * 10 seconds to complete (start to finish), and you call reverse() after 8 seconds, it will run the tweens backwards for another 8 seconds
		 * until the values are back to where they began. You may call reverse() as many times as you want and it will keep flipping the direction.
		 * So if you call reverse() twice, the group of tweens will be back to the original (forward) direction. 
		 * 
		 * @param $forcePlay Forces the group to resume() if it hasn't completed yet or restart() if it has.
		 */
		public function reverse($forcePlay:Boolean=true):void {
			_reversed = !_reversed;
			var i:int, tween:TweenLite, proxy:ReverseProxy, startTime:Number, initTime:Number, prog:Number, tScale:Number, timeOffset:Number = 0, isFinished:Boolean = false;
			var time:Number = (!isNaN(_pauseTime)) ? _pauseTime : TweenLite.currentTime;
			if (this.endTime <= time) {
				timeOffset = int(this.endTime - time) + 1;		
				isFinished = true;
			}
			for (i = _tweens.length - 1; i > -1; i--) {
				tween = _tweens[i];
				
				if (tween is _TweenMax) { //TweenMax instances already have a "reverseEase()" function. I don't use "if (tween is TweenMax)" because it would bloat the file size by having to import TweenMax, so developers can just use this class with TweenLite to keep file size to a minimum if they so choose.
					startTime = tween.startTime;
					initTime = tween.initTime;
					(tween as Object).reverse(false, false);
					tween.startTime = startTime;
					tween.initTime = initTime;
				} else if (tween.ease != tween.vars.ease) {
					tween.ease = tween.vars.ease;
				} else {
					proxy = new ReverseProxy(tween);
					tween.ease = proxy.reverseEase;
				}
				
				tScale = tween.combinedTimeScale;
				prog = (((time - tween.initTime) / 1000) - tween.delay / tScale) / tween.duration * tScale;
				startTime = int(time - ((1 - prog) * tween.duration * 1000 / tScale) + timeOffset);
				tween.initTime = int(startTime - (tween.delay * (1000 / tScale)));
				
				if (tween.startTime != 999999999999999) {
					tween.startTime = startTime;
				}
				if (tween.startTime > time) { //don't allow tweens with delays that haven't expired yet to be active
					tween.enabled = true;
					tween.active = false;
				}
				
			}
			updateTimeSpan();
			if ($forcePlay) {
				if (isFinished) {
					setProgress(0, true);
				}
				resume();
			}
		}
		
		/**
		 * Provides an easy way to determine which tweens (if any) are currently active. Active tweens are not paused and are in the process of tweening values.
		 * 
		 * @return An Array of TweenLite/TweenMax instances from the group that are currently active (in the process of tweening)
		 */
		public function getActive():Array {
			var a:Array = [];
			if (isNaN(_pauseTime)) {
				var i:int, time:Number = TweenLite.currentTime;
				for (i = _tweens.length - 1; i > -1; i--) {
					if (getStartTime(_tweens[i]) <= time && getEndTime(_tweens[i]) >= time) {
						a[a.length] = _tweens[i];
					}				
				}
			}
			return a;
		}
		
		/**
		 * Merges (combines) two TweenGroups. You can even control the index at which the tweens are spliced in, or if you don't define one, the tweens will be added to the end.
		 * 
		 * @param $group The TweenGroup to add
		 * @param $startIndex The index at which to start splicing the tweens from the new TweenGroup. For example, if tweenGroupA has 3 elements, and you want to add tweenGroupB's tweens right after the first one, you'd call tweenGroupA.mergeGroup(tweenGroupB, 1);
		 */
		public function mergeGroup($group:TweenGroup, $startIndex:Number=NaN):void {
			if (isNaN($startIndex) || $startIndex > _tweens.length) {
				$startIndex = _tweens.length;
			}
			var tweens:Array = $group.tweens;
			var l:uint = tweens.length, i:int;
			for (i = 0; i < l; i++) {
				_tweens.splice($startIndex + i, 0, tweens[i]);
			}
			realign();
		}
		
		/**
		 * Removes all tweens from the group and kills the tweens using TweenLite.removeTween()
		 * 
		 * @param $killTweens Determines whether or not all of the tweens are killed (as opposed to simply being removed from this group but continuing to remain in the rendering queue)
		 */
		public function clear($killTweens:Boolean=true):void {
			for (var i:int = _tweens.length - 1; i > -1; i--) {
				if ($killTweens) {
					TweenLite.removeTween(_tweens[i], true);
				}
				_tweens[i] = null;
				_tweens.splice(i, 1);
			}
			if (!this.expired) {
				for (i = _unexpired.length - 1; i > -1; i--) {
					if (_unexpired[i] == this) {
						_unexpired.splice(i, 1);
						break;
					}
				}
				this.expired = true;
			}
		}
		
		/** 
		 * Realigns all the tweens in the TweenGroup based on whatever the "align" property is set to. The only
		 * time you may need to call realign() is if you change a time-related property of an individual tween in the
		 * TweenGroup (like a tween's timeScale or duration). This is very uncommon.
		 */
		public function realign():void {
			if (_align != ALIGN_NONE && _tweens.length > 1) {
				var l:uint = _tweens.length, i:int, offset:Number = _stagger * 1000, prog:Number, rev:Boolean = _reversed;
				
				if (rev) {
					prog = this.progressWithDelay;
					reverse();
					this.progressWithDelay = 0;
				}
				
				if (_align == ALIGN_SEQUENCE) {
					setTweenInitTime(_tweens[0], _initTime);
					for (i = 1; i < l; i++) {
						setTweenInitTime(_tweens[i], getEndTime(_tweens[i - 1]) + offset);
					}
					
				} else if (_align == ALIGN_INIT) {
					for (i = 0; i < l; i++) {
						setTweenInitTime(_tweens[i], _initTime + (offset * i));
					}
					
				} else if (_align == ALIGN_START) {
					for (i = 0; i < l; i++) {
						setTweenStartTime(_tweens[i], _startTime + (offset * i));
					}
					
				} else { //ALIGN_END
					for (i = 0; i < l; i++) {
						setTweenInitTime(_tweens[i], this.endTime - ((_tweens[i].delay + _tweens[i].duration) * 1000 / _tweens[i].combinedTimeScale) - (offset * i));
					}
				}
				
				if (rev) {
					reverse();
					this.progressWithDelay = prog;
				}
				
			}
			updateTimeSpan();
		}
		
		/** 
		 * Analyzes all of the tweens in the group and determines the overall init, start, and end times as well as the overall duration which 
		 * are necessary for accurate management. Normally a TweenGroup handles this internally, but if tweens are manipulated independently
		 * of TweenGroup or if a tween has its "loop" or "yoyo" special property set to true, it can cause these variables to become uncalibrated
		 * in which case you can use updateTimeSpan() to recalibrate. 
		 */
		public function updateTimeSpan():void {
			if (_tweens.length == 0) {
				this.endTime = _startTime = _initTime = 0;
			} else {
				var i:int, start:Number, init:Number, end:Number, tween:TweenLite, repeats:int;
				tween = _tweens[0];
				_initTime = tween.initTime;
				
				_startTime = _initTime + (tween.delay * (1000 / tween.combinedTimeScale));
				this.endTime = _startTime + (tween.duration * (1000 / tween.combinedTimeScale));
				
				for (i = _tweens.length - 1; i > 0; i--) {
					tween = _tweens[i];
					init = tween.initTime;
					if (tween is _TweenMax && tween.initted && (!isNaN(tween.exposedVars.yoyo) || !isNaN(tween.exposedVars.loop))) {
						repeats = (!isNaN(tween.exposedVars.yoyo)) ? tween.exposedVars.yoyo : tween.exposedVars.loop;
						init -= (tween as Object).repeatCount * (tween.duration * 1000 / tween.combinedTimeScale); //resets the initTime (factoring in the loops/yoyo repeats)
					}
					
					start = init + (tween.delay * (1000 / tween.combinedTimeScale));
					end = getEndTime(tween);
					
					if (init < _initTime) {
						_initTime = init;
					}
					if (start < _startTime) {
						_startTime = start;
					}
					if (end > this.endTime) {
						this.endTime = end;
					}
				}
				
				if (this.expired && this.endTime > TweenLite.currentTime) {
					this.expired = false;
					_unexpired[_unexpired.length] = this;
				}
				
			}
		}
		
		public function toString():String {
			return "TweenGroup( " + _tweens.toString() + " )";
		}
		

//---- STATIC PUBLIC FUNCTIONS -----------------------------------------------------------------------------------

		/**
		 * Parses an Array that contains either TweenLite/TweenMax instances or Objects that are meant to define tween instances.
		 * Specifically, they must contain at LEAST "target" and "time" properties. For example: TweenGroup.parse([{target:mc1, time:2, x:300},{target:mc2, time:1, y:400}]);
		 *  
		 * @param $tweens An Array of either TweenLite/TweenMax instances or Objects that are meant to define tween instances. For example [{target:mc1, time:2, x:300},{target:mc2, time:1, y:400}]
		 * @param $BaseTweenClass Defines which tween class should be used when parsing objects that are not already TweenLite/TweenMax instances. Choices are TweenLite or TweenMax.
		 * @return An Array with only TweenLite/TweenMax instances
		 */
		public static function parse($tweens:Array, $DefaultTweenClass:Class=null):Array {
			if ($DefaultTweenClass == null) {
				$DefaultTweenClass = TweenLite;
			}
			var a:Array = [], i:int, target:Object, duration:Number;
			for (i = 0; i < $tweens.length; i++) {
				if ($tweens[i] is TweenLite) {
					a[a.length] = $tweens[i];
				} else {
					target = $tweens[i].target;
					duration = $tweens[i].time;
					delete $tweens[i].target;
					delete $tweens[i].time;
					a[a.length] = new $DefaultTweenClass(target, duration, $tweens[i]);
				}
			}
			return a;
		}
		
		
		/**
		 * Provides an easy way to tween multiple objects to the same values. It also accepts a few special properties, like "stagger" which 
		 * staggers the start time of each tween. For example, you might want to have 5 MovieClips move down 100 pixels while fading out, and stagger 
		 * the start times slightly by 0.2 seconds, you could do:  
		 * TweenGroup.allTo([mc1, mc2, mc3, mc4, mc5], 1, {y:"100", alpha:0, stagger:0.2});
		 * 
		 * @param $targets An Array of objects to tween.
		 * @param $duration Duration (in seconds) of the tween
		 * @param $vars An object containing the end values of all the properties you'd like to have tweened (or if you're using the TweenGroup.allFrom() method, these variables would define the BEGINNING values). Additional special properties: "stagger", "onCompleteAll", and "onCompleteAllParams"
		 * @param $DefaultTweenClass Defines which tween class to use. Choices are TweenLite or TweenMax.
		 * @return TweenGroup instance
		 */
		public static function allTo($targets:Array, $duration:Number, $vars:Object, $DefaultTweenClass:Class=null):TweenGroup {
			if ($DefaultTweenClass == null) {
				$DefaultTweenClass = TweenLite;
			}
			var i:int, vars:Object, p:String;
			var group:TweenGroup = new TweenGroup(null, $DefaultTweenClass, ALIGN_INIT, $vars.stagger || 0);
			group.onComplete = $vars.onCompleteAll;
			group.onCompleteParams = $vars.onCompleteAllParams;
			delete $vars.stagger;
			delete $vars.onCompleteAll;
			delete $vars.onCompleteAllParams;
			for (i = 0; i < $targets.length; i++) {
				vars = {};
				for (p in $vars) {
					vars[p] = $vars[p];
				}
				group[group.length] = new $DefaultTweenClass($targets[i], $duration, vars);
			}
			if (group.stagger < 0) {
				group.progressWithDelay = 0;
			}
			return group;
		}
		
		/**
		 * Exactly the same as TweenGroup.allTo(), but instead of tweening the properties from where they're at currently to whatever you define, this tweens them the opposite way - from where you define TO where ever they are. This is handy for when things are set up on the stage the way they should end up and you just want to tween them into place.
		 * 
		 * @param $targets An Array of objects to tween.
		 * @param $duration Duration (in seconds) of the tween
		 * @param $vars An object containing the beginning values of all the properties you'd like to have tweened. Additional special properties: "stagger", "onCompleteAll", and "onCompleteAllParams"
		 * @param $DefaultTweenClass Defines which tween class to use. Choices are TweenLite or TweenMax.
		 * @return TweenGroup instance
		 */
		public static function allFrom($targets:Array, $duration:Number, $vars:Object, $DefaultTweenClass:Class=null):TweenGroup {
			$vars.runBackwards = true;
			return allTo($targets, $duration, $vars, $DefaultTweenClass);
		}
		

//---- PROTECTED STATIC FUNCTIONS -------------------------------------------------------------------------------

		protected static function checkExpiration($e:Event):void {
			var time:uint = TweenLite.currentTime, a:Array = _unexpired, tg:TweenGroup, i:int;
			for (i = a.length - 1; i > -1; i--) {
				tg = a[i];
				if (tg.endTime > _prevTime && tg.endTime <= time && !tg.paused) {
					a.splice(i, 1);
					tg.expired = true;
					tg.handleCompletion();
				}
			}
			_prevTime = time;
		}
		
		
//---- PROTECTED FUNCTIONS ---------------------------------------------------------------------------------------
				
		protected function offsetTime($tweens:Array, $offset:Number):void {
			if ($tweens.length != 0) {
				var ms:Number = $offset * 1000; //offset in milliseconds
				var time:Number = (isNaN(_pauseTime)) ? TweenLite.currentTime : _pauseTime;
				var tweens:Array = getRenderOrder($tweens, time);
				var isPaused:Boolean, tween:TweenLite, render:Boolean, startTime:Number, end:Number, repeats:int, i:int, toRender:Array = [];
				for (i = tweens.length - 1; i > -1; i--) {
					tween = tweens[i];
					if (tween is _TweenMax && tween.initted && (!isNaN(tween.exposedVars.yoyo) || !isNaN(tween.exposedVars.loop))) {
						repeats = (!isNaN(tween.exposedVars.yoyo)) ? tween.exposedVars.yoyo : tween.exposedVars.loop;
						tween.initTime = tween.initTime + ms - ((tween as Object).repeatCount * (tween.duration * 1000 / tween.combinedTimeScale)); //resets the initTime (factoring in the loops/yoyo repeats)
					} else {
						tween.initTime += ms;
					}
					isPaused = Boolean(tween.startTime == 999999999999999);
					
					startTime = tween.initTime + (tween.delay * (1000 / tween.combinedTimeScale)); //this forces paused tweens with false start times to adjust to the normal one temporarily so that we can render it properly.
					end = getEndTime(tween);
					
					render = ((startTime <= time || startTime - ms <= time) && (end >= time || end - ms >= time)); //only render what's necessary
					
					if (isNaN(_pauseTime) && end >= time) {
						tween.enabled = true; //make sure they're in the rendering queue in case they were already completed!
					}
					if (!isPaused) {
						tween.startTime = startTime;
					}
					if (startTime >= time) { //don't allow tweens with delays that haven't expired yet to be active
						if (!tween.initted) { //otherwise a TweenGroup could be paused immediately after creation, then resumed later and if there's a sequential tween of an object, initTweenVals() could get called before the previous tweens finished running, meaning if the tweens pertain to the same property, the wrong value(s) could get recorded in the tweens Array
							render = false;
						}
						tween.active = false;
					}
					if (render) {
						toRender[toRender.length] = {tween:tween, startTime:startTime};
					}
				}
				
				if ($offset > 0) {
					toRender.sortOn("startTime", Array.NUMERIC);
				} else {
					toRender.sortOn("startTime", Array.NUMERIC | Array.DESCENDING);
				}
				
				
				for (i = toRender.length - 1; i > -1; i--) {
					renderTween(toRender[i].tween, time);
				}
				
				this.endTime += ms;
				_startTime += ms;
				_initTime += ms;
				
				if (this.expired && this.endTime > time) {
					this.expired = false;
					_unexpired[_unexpired.length] = this;
				}
			}
		}
		
		protected function renderTween($tween:TweenLite, $time:Number):void {
			var end:Number = getEndTime($tween), renderTime:Number, isPaused:Boolean;
			if ($tween.startTime == 999999999999999) {
				$tween.startTime = $tween.initTime + ($tween.delay * 1000 / $tween.combinedTimeScale); //this forces paused tweens with false start times to adjust to the normal one temporarily so that we can render it properly.
				isPaused = true;
			}
			if (!$tween.initted) {
				var active:Boolean = $tween.active;
				$tween.active = false; 
				if (isPaused) {
					$tween.initTweenVals();
					if ($tween.vars.onStart != null) {
						$tween.vars.onStart.apply(null, $tween.vars.onStartParams);
					}
				} else {
					$tween.activate(); //triggers the initTweenVals and fires the onStart() if necessary
				}
				$tween.active = active;
			}
			
			if ($tween.startTime > $time) { //don't allow tweens with delays that haven't expired yet to be active
				renderTime = $tween.startTime;
			} else if (end < $time) {
				renderTime = end;
			} else {
				renderTime = $time;
			}
			
			if ($tween is _TweenMax && $tween.initted && (!isNaN($tween.exposedVars.yoyo) || !isNaN($tween.exposedVars.loop))) {
				var repeats:int = (!isNaN($tween.exposedVars.yoyo)) ? $tween.exposedVars.yoyo : $tween.exposedVars.loop;
				var count:int = int((renderTime - $tween.initTime - $tween.delay) / ($tween.duration * 1000 / $tween.combinedTimeScale));
				if (count > repeats) {
					count = repeats;
				}
				($tween as Object).repeatCount = count;	
			}
			
			if (renderTime < 0) { //render time is uint, so it must be zero or greater. 
				var originalStart:Number = $tween.startTime;
				$tween.startTime -= renderTime;
				$tween.render(0);
				$tween.startTime = originalStart;
			} else {
				$tween.render(renderTime);
			}
			
			if (isPaused) {
				$tween.startTime = 999999999999999;
			}
		}
		
		/**
		 * If there are multiple tweens in the same group that control the same property of the same property, we need to make sure they're rendered in the correct
		 * order so that the one(s) closest in proximity to the current time is rendered last. Feed this function an Array of tweens and the time and it'll return
		 * an Array with them in the correct render order.
		 *  
		 * @param $tweens An Array of tweens to get in the correct render order
		 * @param $time Time (in milliseconds) which defines the proximity point for each tween (typically the render time)
		 * @return An Array with the tweens in the correct render order
		 */
		protected function getRenderOrder($tweens:Array, $time:Number):Array {
			var i:int, startTime:Number, postTweens:Array = [], preTweens:Array = [], a:Array = [];
			for (i = $tweens.length - 1; i > -1; i--) {
				startTime = getStartTime($tweens[i]);
				if (startTime >= $time) {
					postTweens[postTweens.length] = {start:startTime, tween:$tweens[i]};
				} else {
					preTweens[preTweens.length] = {end:getEndTime($tweens[i]), tween:$tweens[i]};
				}
			}
			postTweens.sortOn("start", Array.NUMERIC);
			preTweens.sortOn("end", Array.NUMERIC);
			for (i = postTweens.length - 1; i > -1; i--) {
				a[i] = postTweens[i].tween;
			}
			for (i = preTweens.length - 1; i > -1; i--) {
				a[a.length] = preTweens[i].tween;
			}
			return a;
		}
		
		protected function pauseTween($tween:TweenLite):void {
			if ($tween is _TweenMax) {
				($tween as Object).pauseTime = _pauseTime;
			} 
			$tween.startTime = 999999999999999; //for OverwriteManager
			$tween.enabled = false;
		}
		
		protected function resumeTween($tween:TweenLite):void {
			if ($tween is _TweenMax) {
				($tween as Object).pauseTime = NaN;
			}
			$tween.startTime = $tween.initTime + ($tween.delay * (1000 / $tween.combinedTimeScale));
		}
		
		protected function getEndTime($tween:TweenLite):Number {
			var dur:Number = $tween.duration * (1000 / $tween.combinedTimeScale);
			if ($tween is _TweenMax && (!isNaN($tween.exposedVars.yoyo) || !isNaN($tween.exposedVars.loop))) {
				var repeats:Number = (!isNaN($tween.exposedVars.yoyo)) ? $tween.exposedVars.yoyo : $tween.exposedVars.loop;
				if (repeats == 0) {
					return Infinity;
				}
				dur = (repeats - ($tween as Object).repeatCount + 1) * dur;
			}
			return $tween.initTime + ($tween.delay * 1000 / $tween.combinedTimeScale) + dur;
		}
		
		protected function getInitTime($tween:TweenLite):Number {
			if ($tween is _TweenMax && (!isNaN($tween.exposedVars.yoyo) || !isNaN($tween.exposedVars.loop))) {
				return $tween.initTime - (($tween as Object).repeatCount * ($tween.duration * 1000 / $tween.combinedTimeScale)); 
			} else {
				return $tween.initTime;
			}
		}
		
		protected function getStartTime($tween:TweenLite):Number {
			return $tween.initTime + ($tween.delay * 1000 / $tween.combinedTimeScale);
		}
		
		protected function setTweenInitTime($tween:TweenLite, $initTime:Number):void {
			var offset:Number = $initTime - $tween.initTime;
			$tween.initTime = $initTime;
			if ($tween.startTime != 999999999999999) { //required for OverwriteManager (indicates a tween has been paused)
				$tween.startTime += offset;
			}
		}
		
		protected function setTweenStartTime($tween:TweenLite, $startTime:Number):void {
			var offset:Number = $startTime - getStartTime($tween);
			$tween.initTime += offset;
			if ($tween.startTime != 999999999999999) { //required for OverwriteManager (indicates a tween has been paused)
				$tween.startTime = $startTime;
			}
		}
		
		protected function getProgress($includeDelay:Boolean=false):Number {
			if (_tweens.length == 0) {
				return 0;
			} else {
				var time:Number = (isNaN(_pauseTime)) ? TweenLite.currentTime : _pauseTime;
				var min:Number = ($includeDelay) ? _initTime : _startTime;
				var p:Number = (time - min) / (this.endTime - min);
				if (p < 0) {
					return 0;
				} else if (p > 1) {
					return 1;
				} else {
					return p;
				}
			}
		}
		
		protected function setProgress($progress:Number, $includeDelay:Boolean=false):void {
			if (_tweens.length != 0) {
				var time:Number = (isNaN(_pauseTime)) ? TweenLite.currentTime : _pauseTime;
				var min:Number = ($includeDelay) ? _initTime : _startTime;
				offsetTime(_tweens, (time - (min + ((this.endTime - min) * $progress))) / 1000);
			}
		}
		
		public function handleCompletion():void {
			if (!isNaN(this.yoyo) && (_repeatCount < this.yoyo || this.yoyo == 0)) {
				_repeatCount++;
				reverse(true);
			} else if (!isNaN(this.loop) && (_repeatCount < this.loop || this.loop == 0)) {
				_repeatCount++;
				setProgress(0, true);
			}
			if (this.onComplete != null) {
				this.onComplete.apply(null, this.onCompleteParams);
			}
			_dispatcher.dispatchEvent(new Event(Event.COMPLETE));
		}
		
		
		
//---- GETTERS / SETTERS --------------------------------------------------------------------------------------------------
		
		/**
		 * @return Number of tweens in the group 
		 */
		public function get length():uint {
			return _tweens.length;
		}
		
		/**
		 * @return Overall progress of the group of tweens (not including any initial delay) as represented numerically between 0 and 1 where 0 means the group hasn't started, 0.5 means it is halfway finished, and 1 means it has completed.
		 */
		public function get progress():Number {
			return getProgress(false);
		}
		/**
		 * Controls the overall progress of the group of tweens (not including any initial delay) as represented numerically between 0 and 1.
		 * 
		 * @param $n Overall progress of the group of tweens (not including any initial delay) as represented numerically between 0 and 1 where 0 means the group hasn't started, 0.5 means it is halfway finished, and 1 means it has completed.
		 */
		public function set progress($n:Number):void {
			setProgress($n, false);
		}
		
		/**
		 * @return Overall progress of the group of tweens (including any initial delay) as represented numerically between 0 and 1 where 0 means the group hasn't started, 0.5 means it is halfway finished, and 1 means it has completed.
		 */
		public function get progressWithDelay():Number {
			return getProgress(true);
		}
		/**
		 * Controls the overall progress of the group of tweens (including any initial delay) as represented numerically between 0 and 1.
		 * 
		 * @param $n Overall progress of the group of tweens (including any initial delay) as represented numerically between 0 and 1 where 0 means the group hasn't started, 0.5 means it is halfway finished, and 1 means it has completed.
		 */
		public function set progressWithDelay($n:Number):void {
			setProgress($n, true);
		}
		
		/**
		 * @return Duration (in seconds) of the group of tweens NOT including any initial delay
		 */
		public function get duration():Number {
			if (_tweens.length == 0) {
				return 0;
			} else {
				return (this.endTime - _startTime) / 1000;
			}
		}
		/**
		 * @return Duration (in seconds) of the group of tweens including any initial delay
		 */
		public function get durationWithDelay():Number {
			if (_tweens.length == 0) {
				return 0;
			} else {
				return (this.endTime - _initTime) / 1000;
			}
		}
		
		/**
		 * @return If the group of tweens is paused, this value will be true. Otherwise, it will be false.
		 */
		public function get paused():Boolean {
			return (!isNaN(_pauseTime));
		}
		/**
		 * Sets the paused state of the group of tweens
		 * 
		 * @param $b Sets the paused state of the group of tweens.
		 */
		public function set paused($b:Boolean):void {
			if ($b) {
				pause();
			} else {
				resume();
			}
		}
		
		/**
		 * @return If the group of tweens is reversed, this value will be true. Otherwise, it will be false.
		 */
		public function get reversed():Boolean {
			return _reversed;
		}
		/**
		 * Sets the reversed state of the group of tweens
		 * 
		 * @param $b Sets the reversed state of the group of tweens.
		 */
		public function set reversed($b:Boolean):void {
			if (_reversed != $b) {
				reverse(true);
			}
		}
		
		/**
		 * @return timeScale property of the first TweenMax instance in the group (or 1 if there aren't any). Remember, timeScale edits do NOT affect TweenLite instances!
		 */
		public function get timeScale():Number {
			for (var i:uint = 0; i < _tweens.length; i++) {
				if (_tweens[i] is _TweenMax) {
					return _tweens[i].timeScale;
				}
			}
			return 1;
		}
		/**
		 * Changes the timeScale of all TweenMax instances in the TweenGroup. Remember, TweenLite instances are NOT affected by timeScale!
		 * 
		 * @param $n time scale for all TweenMax instances in the TweenGroup. 1 is normal speed, 0.5 is half speed, 2 is double speed, etc.
		 */
		public function set timeScale($n:Number):void {
			for (var i:int = _tweens.length - 1; i > -1; i--) {
				if (_tweens[i] is _TweenMax) {
					_tweens[i].timeScale = $n;
				}
			}
			updateTimeSpan();
		}
		
		/**
		 * @return Alignment of the tweens within the group. possible values are "sequence", "start", "end", "init", and "none"
		 */
		public function get align():String {
			return _align;
		}
		/**
		 * Controls the alignment of the tweens within the group. Typically it's best to use the constants TweenGroup.ALIGN_SEQUENCE, TweenGroup.ALIGN_START, TweenGroup.ALIGN_END, TweenGroup.ALIGN_INIT, or TweenGroup.ALIGN_NONE
		 * 
		 * @param $s Sets the alignment of the tweens within the group. Typically it's best to use the constants TweenGroup.ALIGN_SEQUENCE, TweenGroup.ALIGN_START, TweenGroup.ALIGN_END, TweenGroup.ALIGN_INIT, or TweenGroup.ALIGN_NONE
		 */
		public function set align($s:String):void {
			_align = $s;
			realign();
		}
		
		/**
		 * @return Amount of time (in seconds) to offset each tween according to the current alignment. For example, if the align property is set to ALIGN_SEQUENCE and stagger is 0.5, this adds 0.5 seconds between each tween in the sequence. If align is set to ALIGN_START, it would add 0.5 seconds to the start time of each tween (0 for the first tween, 0.5 for the second, 1 for the third, etc.)
		 */
		public function get stagger():Number {
			return _stagger;
		}
		/**
		 * Controls the amount of time (in seconds) to offset each tween according to the current alignment. For example, if the align property is set to ALIGN_SEQUENCE and stagger is 0.5, this adds 0.5 seconds between each tween in the sequence. If align is set to ALIGN_START, it would add 0.5 seconds to the start time of each tween (0 for the first tween, 0.5 for the second, 1 for the third, etc.)
		 * 
		 * @param $s Amount of time (in seconds) to offset each tween according to the current alignment. For example, if the align property is set to ALIGN_SEQUENCE and stagger is 0.5, this adds 0.5 seconds between each tween in the sequence. If align is set to ALIGN_START, it would add 0.5 seconds to the start time of each tween (0 for the first tween, 0.5 for the second, 1 for the third, etc.)
		 */
		public function set stagger($n:Number):void {
			_stagger = $n;
			realign();
		}
		
		/**
		 * @return An Array of the tweens in this TweenGroup (this could be used to concat() with another TweenGroup for example) 
		 */
		public function get tweens():Array {
			return _tweens.slice();
		}
		
	}
}
	
import gs.TweenLite;

internal class ReverseProxy {
	private var _tween:TweenLite;
	
	public function ReverseProxy($tween:TweenLite) {
		_tween = $tween;
	}
	
	public function reverseEase($t:Number, $b:Number, $c:Number, $d:Number):Number {
		return _tween.vars.ease($d - $t, $b, $c, $d);
	}
	
}