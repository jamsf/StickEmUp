package com.stickemup.worlds;

import com.stickemup.entities.Player;
import com.stickemup.worlds.IsoWorld;

/**
 * ...
 * @author jams
 */
class Bank extends IsoWorld
{
	public function new() 
	{
		super();
	}
	
	override public function begin()
	{
		super.begin();
		
		add(new Player());
	}
	
	override public function update() 
	{
		super.update();
		
	}
}