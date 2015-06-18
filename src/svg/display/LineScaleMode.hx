package svg.display;
#if flash
typedef LineScaleMode = flash.display.LineScaleMode;
#else
enum LineScaleMode 
{
   NORMAL; // default
   NONE;
   VERTICAL;
   HORIZONTAL;   
   OPENGL;
}


#end