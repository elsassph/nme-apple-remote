package org.haxenme.appleRemote;

import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nme.peripherals.AppleRemote;
import nme.text.TextField;
import nme.text.TextFormat;

/**
 * Example use of the NME Apple Remote extension
 * @author Philippe Elsass
 */
class ExtensionTest extends Sprite 
{
	var label:TextField;
	var lines:Array<String>;
	
	public function new() 
	{	
		super();
		init();
		AppleRemote.setEventHandler(onRemote);
		appendText("Waiting for remote...");
	}

	private function appendText(txt) 
	{
		lines.push(txt);
		if (lines.length > 25) lines.shift();
		label.text = lines.join("\n");
	}

	private function onRemote(e:Dynamic):Void
	{
		appendText("" + e);
	}
	
	private function init():Void 
	{
		lines = [];

		label = new TextField ();	
		label.defaultTextFormat = new TextFormat("_sans", 16, 0x222222);
		label.width = 620;
		label.height = 460;
		label.x = 10;
		label.y = 10;
		label.selectable = false;
		label.wordWrap = true;
		addChild (label);
	}
	
	// Entry point
	public static function main () 
	{		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.addChild(new ExtensionTest());	
	}	
	
}

