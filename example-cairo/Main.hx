package;

import cairo.CairoSurface;
import cairo.CairoContext;
/**
 * ...
 * @author Jonas Nyström
 */
class Main
{
	static public function main() 
	{
		trace('example-cairo');
		
		var surface:CairoSurface = CairoSurface.createForPdf("ExampleCairo.pdf", 500, 500);
		var context:CairoContext = surface.getContext();
		context.saveRestore(function() {
			context.setSourceRgba(1, 0.2, 0.2, 0.6);
			context.setLineWidth(8.0);
			context .moveTo(90, 50);
			context.curveTo(90, 72, 72, 90, 50, 90);			
			context.curveTo(27, 90, 10, 72, 10, 50);
			context.curveTo(10, 27, 27, 10, 50, 10);
			context.curveTo(72, 10, 90, 27, 90, 50);
			context.stroke();			
		});		
		
		surface.writeToPng('ExampleCairo.png');
	}
	
}