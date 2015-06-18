package svg.gfx;

import svg.geom.Matrix;
import svg.display.GradientType;
import svg.display.SpreadMethod;
import svg.display.InterpolationMethod;
import svg.display.CapsStyle;
import svg.display.JointStyle;
import svg.display.LineScaleMode;

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
   public var colors:Array<UInt>;
   public var alphas:Array<Float>;
   public var ratios:Array<Int>;
   public var matrix: Matrix;
   public var spread: SpreadMethod;
   public var interp:InterpolationMethod;
   public var focus:Float;

}

