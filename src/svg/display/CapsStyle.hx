package svg.display;
#if flash
typedef CapsStyle = flash.display.CapsStyle;
#else

enum CapsStyle 
{
   ROUND; // default
   NONE;
   SQUARE;
}


#end