﻿package blitter{		import flash.display.BitmapData;	public class BlObject	{		private var _x:Number = 0;		private var _y:Number = 0;						public var width:int = 1;		public var height:int = 1;				public var moving:Boolean = false;		public var hitmap:BlTilemap						public function update():void{					}						public function get x():Number		{			return _x;		}				public function set x(value:Number):void		{			_x = value;		}				public function get y():Number		{			return _y;		}				public function set y(value:Number):void		{			_y = value;		}						public function draw(target:BitmapData, ox:int, oy:int):void{			target.setPixel(				x+ox,				y+oy,				0xffffff			);		}				public function enterFrame():void{				}				public function tick():void{			update();		}						public function exitFrame():void{		}										}}