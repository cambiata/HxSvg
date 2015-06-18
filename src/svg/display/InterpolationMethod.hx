package svg.display;
#if flash
typedef InterpolationMethod = flash.display.InterpolationMethod;
#else
enum InterpolationMethod 
{
   RGB;
   LINEAR_RGB;
}


#end