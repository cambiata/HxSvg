package svg.gfx;

/**
 * ...
 * @author Jonas Nyström
 */
class Gfx2Commands extends Gfx
{
	public var commands: Array<GfxCommand>;
	public function new() 
	{
		super();
		this.commands = [];
	}
	
	override public function beginGradientFill(grad:Gradient) //commands.push("g.beginGradientFill(" + grad.type + ","+  grad.colors + "," +  grad.alphas + "," + grad.ratios + "," +  newMatrix(grad.matrix) + "," +  grad.spread + "," + grad.interp+ "," +  grad.focus  + ");" );
	commands.push(GfxCommand.beginGradientFill(grad));
		
	override public function beginFill(color:Int, alpha:Float)   //commands.push("g.beginFill(" + color + "," + f2a(alpha)  + ");");
	commands.push(GfxCommand.beginFill(color, alpha));
	
	override public function endFill()  
		//commands.push("g.endFill();"); 
	commands.push(GfxCommand.endFill);
	
	override public function lineStyle(style:LineStyle) //commands.push("g.lineStyle("+f2a(style.thickness)+","+style.color+","+f2a(style.alpha)+"," + style.pixelHinting + "," +  style.scaleMode + "," + style.capsStyle + "," +style.jointStyle + "," + f2a(style.miterLimit )+ ")" );
	commands.push(GfxCommand.lineStyle(style));
	
	override public function endLineStyle() //commands.push("g.lineStyle();"); 
	commands.push(GfxCommand.endLineStyle);
		
	override public function moveTo(inX:Float, inY:Float) //commands.push("g.moveTo(" + inX + "," + inY + ");"); 
	commands.push(GfxCommand.moveTo(inX, inY));
	
	override public function lineTo(inX:Float, inY:Float) //commands.push("g.lineTo(" + inX + "," + inY + ");"); 
	commands.push(GfxCommand.lineTo(inX, inY));
	
	override public function curveTo(inCX:Float, inCY:Float, inX:Float, inY:Float) //commands.push("g.curveTo(" + inCX + "," + inCY + "," + inX + "," + inY + ");"); 	
	commands.push(GfxCommand.curveTo(inCX, inCY, inX, inY));
	
}