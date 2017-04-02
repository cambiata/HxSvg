package graphics.display;
#if flash
typedef GradientType = flash.display.GradientType;
#else

enum GradientType
{
	RADIAL;
	LINEAR;
}

#end