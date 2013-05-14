package com.stickemup.entities;

import com.haxepunk.graphics.Spritemap;
import nme.geom.Point;
import nme.geom.Rectangle;

/**
 * ...
 * @author jams
 */
class Person extends IsoEntity
{
	/* Movement Variables */
	private var _xVel		: Float;
	private var _yVel		: Float;
	private var _xMaxVel	: Float;
	private var _yMaxVel	: Float;
	private var _accel		: Float;
	private var _decel		: Float;
	private var _bottomColl	: Rectangle;
	private var _focus		: Point;
	
	/* Weapon Variables */
	//private var _handledWeapon		: Weapon;
	//private var _pistolAmmunition	: int;
	
	/* Graphic Variables */
	private var _spriteFile		: String;
	private var _spriteMap		: Spritemap;
	
	public function new() 
	{
		super();
		_xVel = 0;
		_yVel = 0;
	}
	
	override public function update() 
	{
		super.update();
		moveBy(_xVel, _yVel);
		updateAnimation();
	}
	
	override public function added() 
	{
		super.added();
		
		width = 64;
		height = 128;
	}
	
	private function updateAnimation()
	{
		
	}
	
	private function checkCollisions()
	{
		// Check wall collisions
		
	}
	
	public function focus() : Point { return _focus; }
}