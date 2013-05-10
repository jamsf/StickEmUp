package src.com.stickemup.entities;

/**
 * ...
 * @author jams
 */
class Player extends Person
{
[Embed(source = '/../assets/sprites/player_spritemap.png')] private const PLAYER_SPRITEMAP:Class;
		
		/* Variables */
		/** @private */ private var _reticle	:Reticle;
		
		public function new() 
		{
			super();
		}
		
		override public function added():void 
		{
			super.added();
			
			_xMaxVel = 4;
			_yMaxVel = 3;
			_accel = 0.75;
			_decel = 2;
			
			_reticle = new Reticle();
			FP.world.add(_reticle);
			
			_spriteMap = new Spritemap(PLAYER_SPRITEMAP, 64, 128);
			_spriteMap.add("leftNormalStand", [0]);
			_spriteMap.add("rightNormalStand", [1]);
			_spriteMap.add("leftRobberStand", [2]);
			_spriteMap.add("rightRobberStand", [3]);
			
			_spriteMap.add("rightNormalForMove", [4, 5, 6, 7], 5, true);
			_spriteMap.add("leftNormalForMove", [8, 9, 10, 11], 5, true);
			_spriteMap.add("rightRobberForMove", [12, 13, 14, 15], 5, true);
			_spriteMap.add("leftRobberForMove", [16, 17, 18, 19], 5, true);
			
			
			_spriteMap.add("rightNormalBackMove", [7, 6, 5, 4], 5, true);
			_spriteMap.add("leftNormalBackMove", [11, 10, 9, 8], 5, true);
			_spriteMap.add("rightRobberBackMove", [15, 14, 13, 12], 5, true);
			_spriteMap.add("leftRobberBackMove", [19, 18, 17, 16], 5, true);
			
			graphic = _spriteMap;
			_spriteMap.play("rightRobberStand", true);
			
			_focus = new Point();
			
			_bottomColl = new Rectangle(x, y + height / 4, width, height / 4);
		}
		
		override public function update():void 
		{
			updateMovement();
			super.update();
			
		}
		
		private function updateMovement():void
		{
			// Y axis movement
			if (Input.check(Key.S))
			{
				if (_yVel < 0)
					_yVel += _decel;
				else
				{
					if (_yVel < _yMaxVel)
						_yVel += _accel;
					else
						_yVel = _yMaxVel;
				}
			}
			else if (Input.check(Key.W))
			{
				if (_yVel > 0)
					_yVel -= _decel;
				else
				{
					if (_yVel > -_yMaxVel)
						_yVel -= _accel;
					else
						_yVel = -_yMaxVel;
				}
			}
			else
			{
				// FRICTION
				_yVel = _yVel - Math.min(Math.abs(_yVel), _accel) * MathPlus.sgn(_yVel);
			}
			
			// X axis movement
			if (Input.check(Key.D))
			{
				if (_xVel < 0)
					_xVel += _decel;
				else
				{
					if (_xVel < _xMaxVel)
						_xVel += _accel;
					else
						_xVel = _xMaxVel;
				}
			}
			else if (Input.check(Key.A))
			{
				if (_xVel > 0)
					_xVel -= _decel;
				else
				{
					if (_xVel > -_xMaxVel)
						_xVel -= _accel;
					else
						_xVel = -_xMaxVel;
				}
			}
			else
			{
				// FRICTION
				_xVel = _xVel - Math.min(Math.abs(_xVel), _accel) * MathPlus.sgn(_xVel);
			}
			
			// Update facing direction
			_focus.x = Input.mouseX;
			_focus.y = Input.mouseY;
		}
		
		override protected function updateAnimation():void 
		{
			super.updateAnimation();
			
			if (_focus.x < x + this.width * 0.5)
			{
				if (_xVel > 0)
					_spriteMap.play("leftRobberBackMove");
				else if (_xVel < 0 || _yVel != 0)
					_spriteMap.play("leftRobberForMove");
				else
					_spriteMap.play("leftRobberStand");
			}
			else
			{
				if (_xVel < 0)
					_spriteMap.play("rightRobberBackMove");
				else if (_xVel > 0 || _yVel != 0)
					_spriteMap.play("rightRobberForMove");
				else
					_spriteMap.play("rightRobberStand");
			}
		}
	}
}