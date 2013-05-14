package com.stickemup;

import com.haxepunk.Engine;
import com.haxepunk.HXP;
import com.stickemup.worlds.Bank;

/**
 * ...
 * @author Jams
 */

class Main extends Engine 
{
	
	override public function init()
	{
#if debug
		HXP.console.enable();
#end
		HXP.screen.scale = 3;
		
		HXP.world = new Bank();
	}

	public static function main()
	{
		new Main();
	}
}
