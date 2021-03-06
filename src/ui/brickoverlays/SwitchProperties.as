package ui.brickoverlays
{
	import blitter.Bl;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldType;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.TextEvent;
	
	import items.ItemId;
	
	import ui2.ui2minusbtn;
	import ui2.ui2plusbtn;
	import ui2.ui2properties;
	
	public class SwitchProperties extends PropertiesBackground
	{
		public var inptf:TextField;
		
		private var allowAll:Boolean = false;
		
		public function SwitchProperties(bricktype:int){
			
			var tf:TextField = new TextField();
			tf.embedFonts = true;
			tf.selectable = false;
			tf.sharpness = 100;
			tf.multiline = false;
			tf.wordWrap = false;				
			
			var tff:TextFormat = new TextFormat("system",12,0xffffff);
			tf.defaultTextFormat = tff;
			tf.width = 280;
			tf.x = -150;
			tf.y = -38;
			
			if (bricktype == ItemId.SWITCH_PURPLE || bricktype == ItemId.SWITCH_ORANGE){
				tf.text = "ID of this switch";
			} else if (bricktype == ItemId.RESET_PURPLE || bricktype == ItemId.RESET_ORANGE){
				tf.text = "ID of this switch reset";
				allowAll = true;
			} else if (bricktype == ItemId.DOOR_PURPLE || bricktype == ItemId.DOOR_ORANGE || bricktype == ItemId.SPIKE_DOOR_PURPLE || bricktype == ItemId.SPIKE_DOOR_ORANGE){
				tf.text = "ID of this door";
			} else {
				tf.text = "ID of this gate";
			}
			
			if (!allowAll && Bl.data.switchId < 0) Bl.data.switchId = 0;
			
			tf.height = tf.textHeight
			addChild(tf)	
			
			inptf = new TextField();
			inptf.selectable = true;
			inptf.sharpness = 100;
			inptf.multiline = false
			inptf.borderColor = 0xffffff;
			inptf.backgroundColor = 0xAAAAAA;
			inptf.background = true;
			inptf.border = true;
			inptf.restrict = "0-9";
			inptf.maxChars = 3;
			inptf.type = TextFieldType.INPUT;
			
			inptf.addEventListener(Event.CHANGE, function(e:Event):void{
				var pid:int = parseInt(inptf.text);
				trace("Input: " + pid + " - " + inptf.text);
				if(!isNaN(pid) && pid >= (allowAll ? -1 : 0) && pid <= 999){
					Bl.data.switchId = pid;
				}
			});
			
			var inptff:TextFormat = new TextFormat("Arial", 12, 0x0, null, null, null, null, null, TextFormatAlign.CENTER);
			inptf.defaultTextFormat = inptff;
			inptf.text = Bl.data.switchId;
			inptf.height = tf.height+3;
			inptf.width = 30;
			inptf.y = -38
			inptf.x = 130-35;
			
			inptf.addEventListener(FocusEvent.FOCUS_IN, function(e:Event):void{
				e.preventDefault();
				e.stopImmediatePropagation();
				e.stopPropagation()
			});
			
			inptf.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void{
				e.preventDefault();
				e.stopImmediatePropagation();
				e.stopPropagation();
			})
			
			
			var add:ui2plusbtn = new ui2plusbtn();
			add.y = -29
			add.x = 130+10;
			addChild(add);
			
			
			add.addEventListener(MouseEvent.MOUSE_DOWN, function():void {
				incrementValue();
			})
			
			var sub:ui2minusbtn = new ui2minusbtn();
			sub.y = -29
			sub.x = 130-34-16;
			addChild(sub);
			
			sub.addEventListener(MouseEvent.MOUSE_DOWN, function():void {
				decrementValue();
			})
			
			
			addChild(inptf);
			
			//			this.bg.height = 50;
			setSize(325,50);
		}
		
		public override function incrementValue(amount:int = 1):void {
			if (Bl.data.switchId < 999) Bl.data.switchId++;
			inptf.text = Bl.data.switchId;
		}
			
		public override function decrementValue(amount:int = 1):void {
			if (Bl.data.switchId > (allowAll ? -1 : 0)) Bl.data.switchId--;
			inptf.text = Bl.data.switchId;
		}
	}
}