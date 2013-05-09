package src.com.stickemup.entities;

/**
 * ...
 * @author jams
 */
class Person extends IsoEntity
{
	/* Movement Variables */
		/** @protected */ protected var _xVel		: Number;
		/** @protected */ protected var _yVel		: Number;
		/** @protected */ protected var _xMaxVel	: Number;
		/** @protected */ protected var _yMaxVel	: Number;
		/** @protected */ protected var _accel		: Number;
		/** @protected */ protected var _decel		: Number;
		/** @protected */ protected var _bottomColl	: Rectangle;
		/** @protected */ protected var _focus		: Point;
		
		/* Weapon Variables */
		/** @protected */ protected var _handledWeapon		: Weapon;
		/** @protected */ protected var _pistolAmmunition	: int;
		
		/* Graphic Variables */
		/** @protected */ protected var _spriteMap	: Spritemap;
		
		public function new() 
		{
			_xVel = 0;
			_yVel = 0;
		}
		
		override public function update():void 
		{
			super.update();
			moveBy(_xVel, _yVel);
			updateAnimation();
		}
		
		override public function added():void 
		{
			super.added();
			
			width = 64;
			height = 128;
		}
		
		protected function updateAnimation():void
		{
			
		}
		
		protected function checkCollisions():void
		{
			// Check wall collisions
			
		}
		
		public function focus() : Point { return _focus; }
	}
}