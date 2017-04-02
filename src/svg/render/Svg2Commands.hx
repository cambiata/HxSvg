package svg.render;

import svg.GraphicCommands;
import svg.GraphicCommand;
import format.svg.BaseRenderer;
import format.svg.SVGData;
import svg.gfx.*;

class Svg2Commands
{

	static public function toCommands(svg:Xml):Array<GraphicCommand>
	{
		var inSvg = new SVGData(svg, true);
		var renderer = new BaseRenderer(new SVGData(svg, true));
		var commands = renderer.iterate(new GraphicCommands(), null).commands;
		return commands;
	}

}