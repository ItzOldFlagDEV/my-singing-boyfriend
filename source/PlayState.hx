package;

import openfl.display3D.Context3DTriangleFace;
import flixel.ui.FlxSpriteButton;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxObject;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;
/*
#if desktop
import Discord.DiscordClient;
import sys.thread.Thread;
#end
*/

using StringTools;

class PlayState extends FlxState
{
	var sprite:FlxSprite;

	override public function create()
	{
		/*
		#if desktop
		DiscordClient.initialize();
		#end

		#if desktop
		DiscordClient.changePresence("Playing with him/her singing BF", null);
		#end
		*/

		#if desktop
		FlxG.updateFramerate = 120;
		FlxG.drawFramerate = 120;
		#end

		FlxG.autoPause = false;
		FlxG.camera.antialiasing = true;
		FlxG.mouse.visible = false;

		super.create();

		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic('assets/images/bgFull.png');
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);

		sprite = new Player(0, 0);
		sprite.screenCenter(X);
		sprite.y = 250;
		sprite.flipX = true;
		add(sprite);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A)
		{
			sprite.animation.play('singLEFT', true);
			FlxG.sound.play('assets/sounds/BFLeft.ogg', 0.8);
		}
		if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W)
		{
			sprite.animation.play('singUP', true);
			FlxG.sound.play('assets/sounds/BFUp.ogg', 0.8);
		}
		if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S)
		{
			sprite.animation.play('singDOWN', true);
			FlxG.sound.play('assets/sounds/BFDown.ogg', 0.8);
		}
		if (FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.D)
		{
			sprite.animation.play('singRIGHT', true);
			FlxG.sound.play('assets/sounds/BFRight.ogg', 0.8);
		}

		if (sprite.animation.finished)
		{
			sprite.animation.play('idle', true);
		}
	}
}
