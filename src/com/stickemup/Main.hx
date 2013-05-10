package com.stickemup;

import com.haxepunk.Engine;
import com.haxepunk.utils.Input;

/**
 * ...
 * @author Jams
 */

class Main extends Engine 
{
	
	public function new() 
	{
		super(800, 600, 60, false);
			
			// Create a Bank world
			//FP.world = new Bank();
			
	}
	
	override public function init()
	{
		Sys.println("THIS IS WORKING PROPERLY");
	}
	
	override public function update() 
	{
		super.update();
		
		if (Input.check(Key.DELETE))
			FP.console.enable();
		Input.mouseCursor = "hide";
	}
}
