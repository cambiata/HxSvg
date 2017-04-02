package format.gfx;

import format.svg.Text;
/**
 * ...
 * @author Jonas Nyström
 */
enum GfxCommand
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