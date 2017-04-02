package render;

import format.gfx.Gfx2Commands;
import format.gfx.GfxCommand;
import format.svg.BaseRenderer;
import format.svg.SVGData;
import svg.gfx.*;

class Svg2Commands
{

	static public function toCommands(svg:Xml):Array<GfxCommand>
	{
		var inSvg = new SVGData(svg, true);
		var renderer = new BaseRenderer(new SVGData(svg, true));
		var commands = renderer.iterate(new Gfx2Commands(), null).commands;
		return commands;
	}

}