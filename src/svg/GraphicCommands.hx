package svg;

import format.gfx.*;

/**
 * ...
 * @author Jonas Nyström
 */
 
class GraphicCommands extends Gfx
{
	public var commands: Array<GraphicCommand>;
	public function new() 
	{
		super();
		this.commands = [];
	}
	
	override public function beginGradientFill(grad:Gradient) //commands.push("g.beginGradientFill(" + grad.type + ","+  grad.colors + "," +  grad.alphas + "," + grad.ratios + "," +  newMatrix(grad.matrix) + "," +  grad.spread + "," + grad.interp+ "," +  grad.focus  + ");" );
	commands.push(GraphicCommand.beginGradientFill(grad));
		
	override public function beginFill(color:Int, alpha:Float)   //commands.push("g.beginFill(" + color + "," + f2a(alpha)  + ");");
	commands.push(GraphicCommand.beginFill(color, alpha));
	
	override public function endFill()  
		//commands.push("g.endFill();"); 
	commands.push(GraphicCommand.endFill);
	
	override public function lineStyle(style:LineStyle) //commands.push("g.lineStyle("+f2a(style.thickness)+","+style.color+","+f2a(style.alpha)+"," + style.pixelHinting + "," +  style.scaleMode + "," + style.capsStyle + "," +style.jointStyle + "," + f2a(style.miterLimit )+ ")" );
	commands.push(GraphicCommand.lineStyle(style));
	
	override public function endLineStyle() //commands.push("g.lineStyle();"); 
	commands.push(GraphicCommand.endLineStyle);
		
	override public function moveTo(inX:Float, inY:Float) //commands.push("g.moveTo(" + inX + "," + inY + ");"); 
	commands.push(GraphicCommand.moveTo(inX, inY));
	
	override public function lineTo(inX:Float, inY:Float) //commands.push("g.lineTo(" + inX + "," + inY + ");"); 
	commands.push(GraphicCommand.lineTo(inX, inY));
	
	override public function curveTo(inCX:Float, inCY:Float, inX:Float, inY:Float) //commands.push("g.curveTo(" + inCX + "," + inCY + "," + inX + "," + inY + ");"); 	
	commands.push(GraphicCommand.curveTo(inCX, inCY, inX, inY));
	
}