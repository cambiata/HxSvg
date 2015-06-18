package svg;

import svg.geom.Matrix;
import svg.SVGData;
import svg.DebugRenderer;


class SVG {	
	public var data:SVGData;
	
	public function new (content:String) {		
		data = new SVGData (Xml.parse (content));		
	}
	
	public function render (x:Float = 0, y:Float = 0, width:Int = -1, height:Int = -1) {
		
		var matrix = new svg.geom.Matrix ();
		matrix.identity ();
		matrix.translate (x, y);
		
		if (width > -1 && height > -1) {
			matrix.scale (width / data.width, height / data.height);
		}
		
		var renderer = new svg.DebugRenderer (data);
		renderer.render (matrix);
		
	}

	
}