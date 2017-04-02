# HxSvg
Work-in-progress proof-of-concept SVG library for Haxe. Based on NME/OpenFL svg solutions, but decoupled from flash drawing api. Runs on all major Haxe targets, including C# and Java. 

The SVG graphic information is abstracted to a list of graphic commands:
```haxe
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
```

This can be interpreted/transformed for different targets. For example can cubic bezieer (used by flash drawing API) information be transformed to quadratic bezieers used by Cairo API.

### Status
- No actual rendering, except for experimental commands-to-cairo stuff.
- Simple neko/cairo and C++/cairo examples - example-cairo/

### Credits
- Hugh Sanderson and Joshua Granick for all core code
- Carlos Ballesteros Velasco for Haxe-Cairo

### Screenshot
Actual pdf output from the commands-to-cairo renderer, using Haxe-Cairo:
- ![screen](/screen.png?raw=true "screen")


