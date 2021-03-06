package ;
import haxolotl.core.Texture;
import haxolotl.core.TextureRegion;
import haxolotl.display.Image;

/**
 * ...
 * @author Thomas B
 */
class Bunny extends Image
{
	var vitX : Float;
	var vitY : Float;
	
	var time : Int;

	public function new() 
	{
		var atlas = Main.atlas;
		
		super(atlas.get("bunny"));
		
		vitX = Math.random() * 15 + 8;
		vitY = Math.random() * - 2 - 4;
		
		x = 40 - width/2;
		y = 110 - height / 2;
		
		interactive = false;
		
		alpha = 0;
		color = cast Math.random() * 0xffffff;
		
		time = cast Math.random() * 500;
		
		HOVERED.add(onHoveredd);
		UPDATED.add(onEnterFrame);
	}
	
	function onHoveredd(a) 
	{
		if (parent != null)
			parent.remove(this);
	}
	
	public function onEnterFrame(deltatTime : Float) 
	{
		x += vitX;
		
		if (alpha < 1)
			alpha += 0.02;
		
		if (x + width > scene.width)
		{
			x = scene.width - width;
			vitX *= -1;
		}
		else if (x < 0)
		{
			x = 0;
			vitX *= -1;
		}
		
		vitY += 0.3;
		y += vitY;
		
		if (y + height > scene.height)
		{
			y = scene.height - height;
			vitY *= -0.9;
		}
		
		time--;
		
		if (time <= 0)
		{
			time = cast Math.random() * 500;
			vitY += Math.random() * -6;
		}
	}
}