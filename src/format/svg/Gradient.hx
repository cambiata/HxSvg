package format.svg;

import flash.geom.Matrix;
import graphics.display.GradientType;
import graphics.display.SpreadMethod;
import graphics.display.InterpolationMethod;
import graphics.display.CapsStyle;
import graphics.display.JointStyle;
import graphics.display.LineScaleMode;

class Gradient
{
   public function new()
   {
      type = GradientType.LINEAR;
      colors = [];
      alphas = [];
      ratios = [];
      matrix = new Matrix();
      spread = SpreadMethod.PAD;
      interp = InterpolationMethod.RGB;
      focus = 0.0;
   }

   public var type:GradientType;
   public var colors:Array<Int>;
   public var alphas:Array<Float>;
   public var ratios:Array<Int>;
   public var matrix: Matrix;
   public var spread: SpreadMethod;
   public var interp:InterpolationMethod;
   public var focus:Float;

}

