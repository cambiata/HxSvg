package svg;

import format.svg.Text;
import format.gfx.*;
/**
 * ...
 * @author Jonas Nyström
 */

 
enum GraphicCommand
{
	size(inWidth:Float, inHeight:Float);
	beginGradientFill(grad:Gradient);
	beginFill(color:Int, alpha:Float);
	endFill;
	lineStyle(style:LineStyle);
	endLineStyle;
	moveTo(inX:Float, inY:Float);
	lineTo(inX:Float, inY:Float);
	curveTo(inCX:Float, inCY:Float, inX:Float, inY:Float);
	renderText(text:Text);
}