package graphics.display;
#if flash
typedef JointStyle = flash.display.JointStyle;
#else
enum JointStyle
{
	ROUND; // default
	MITER;
	BEVEL;
}

#end