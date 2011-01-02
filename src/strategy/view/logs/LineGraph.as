package strategy.view.logs {
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import flash.display.Shape;
	
	public class LineGraph extends Sprite {
		
		protected var _colour:uint;
		
		protected var _maxValue:Number;
		
		protected var _numberOfPoints:uint;
		
		protected var _dimensions:Rectangle  
		
		protected const POINT_RADIUS:Number = 4;   
		
		protected var _pointIndex:uint;
		
		protected var _lineHolder:Sprite;
		
		//--------------------------------------------------------------------------
		//
		//  Initialization
		//
		//--------------------------------------------------------------------------
		/**
		 * Event handling takes place via the mediator: LineGraphMediator 
		 * 
		 */
		
		public function LineGraph(dimensions:Rectangle, numberOfPoints:uint, maxValue:Number, colour:uint = 0xFFFFFF) {			
			_dimensions = dimensions;
			_numberOfPoints = numberOfPoints;
			_maxValue = maxValue;
			_colour = colour; 
			_pointIndex = 0;
			init();
		}
		
		protected function init():void
		{
			drawAxis();
			_lineHolder = new Sprite();
			addChild(_lineHolder);
			_lineHolder.graphics.lineStyle(1,_colour);
		} 
		
		public function addPoint(value:Number):void
		{
			var pointDrawn:Shape = drawPoint();
			addChild(pointDrawn);
			var pointX:Number = nextX;
			var pointY:Number = findY(value);
			pointDrawn.x = pointX;
			pointDrawn.y = pointY; 
			_lineHolder.graphics.lineTo(pointX, pointY);
		}
		
		protected function drawAxis():void
		{
			var axis:Sprite = new Sprite();
			addChild(axis);
			axis.graphics.lineStyle(2, _colour, 1);
			
			axis.graphics.moveTo(0,-_dimensions.height);
			axis.graphics.lineTo(0,0);
			axis.graphics.lineTo(_dimensions.width, 0);
		}
		
		protected function drawPoint():Shape
		{
			var point:Shape = new Shape();
			point.graphics.beginFill(_colour);
			point.graphics.drawCircle(0,0,POINT_RADIUS);
			return point;
		}
		
		protected function get nextX():Number
		{
			_pointIndex++;
			return (_pointIndex/_numberOfPoints) * _dimensions.width;
		}
		
		protected function findY(value:Number):Number
		{
			var percentage:Number = value/_maxValue;
			return percentage * -_dimensions.height;
		}
		
	}
}