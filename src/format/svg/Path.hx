package format.svg;

import graphics.geom.Matrix;
import graphics.display.GradientType;
import graphics.display.SpreadMethod;
import graphics.display.InterpolationMethod;
import graphics.display.CapsStyle;
import graphics.display.JointStyle;
import graphics.display.LineScaleMode;

typedef PathSegments = Array<PathSegment>;

class Path
{
   public function new() { }

   public var matrix:Matrix;
   public var name:String;
   public var font_size:Float;
   public var fill:FillType;
   public var alpha:Float;
   public var fill_alpha:Float;
   public var stroke_alpha:Float;
   public var stroke_colour:Null<Int>;
   public var stroke_width:Float;
   public var stroke_caps:CapsStyle;
   public var joint_style:JointStyle;
   public var miter_limit:Float;

   public var segments:PathSegments;
}
