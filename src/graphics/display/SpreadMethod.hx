package graphics.display;
#if flash

typedef SpreadMethod = flash.display.SpreadMethod;
#else
enum SpreadMethod
{
	PAD;
	REPEAT;
	REFLECT;
}

#end