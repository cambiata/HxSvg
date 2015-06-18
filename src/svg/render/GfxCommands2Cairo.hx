package svg.render;
import cairo.CairoContext;
import cairo.CairoFillRule;
import cairo.CairoPoint;
import svg.gfx.GfxCommand;

/**
 * ...
 * @author Jonas Nyström
 */
class GfxCommands2Cairo
{
	
	var context:CairoContext;
	var commands:Array<GfxCommand>;

	public function new(commands: Array<GfxCommand>, context:CairoContext) 
	{
		this.commands = commands;
		this.context = context;
	}
	
	public function render() {
		context.saveRestore(function() {			
			for (command in commands) {
				switch command {
					case moveTo(x, y): context.moveTo(x, y);
					case lineTo(x, y): context.lineTo(x, y);
					case curveTo(x1, y1, x2, y2): curveToQ(context, x1, y1, x2, y2);
					case _: //
				}
			}
			
			context.setFillRule(CairoFillRule.EVEN_ODD);
			context.setSourceRgb(0, 1, 0);
			context.fill();			
			
		});
	}
	
	static public function curveToQ(context:CairoContext, x1:Float, y1:Float, x2:Float, y2:Float) {			
			var point:CairoPoint  = context.getCurrentPoint();		
			context.curveTo(
				2.0 / 3.0 * x1 + 1.0 / 3.0 * point.x,
				2.0 / 3.0 * y1 + 1.0 / 3.0 * point.y,
				2.0 / 3.0 * x1 + 1.0 / 3.0 * x2,
				2.0 / 3.0 * y1 + 1.0 / 3.0 * y2,
				x2, y2
			);
	}	
	
}