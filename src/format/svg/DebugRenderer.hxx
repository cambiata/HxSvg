package svg;



import svg.geom.Matrix;
import svg.geom.Rectangle;
import svg.gfx.Gfx2Commands;
import svg.gfx.Gfx2Haxe;
import svg.gfx.GfxExtent;
import svg.gfx.GfxTextFinder;
import svg.gfx.LineStyle;
import svg.PathParser;
import svg.PathSegment;

import svg.Grad;
import svg.Group;
import svg.FillType;
import svg.gfx.Gfx;


class DebugRenderer
{
    public var width(default,null):Float;
    public var height(default,null):Float;

    var mSvg:SVGData;
    var mRoot:Group;
    var mGfx : Gfx;
    var mMatrix : Matrix;
    var mScaleRect:Rectangle;
    var mScaleW:Null<Float>;
    var mScaleH:Null<Float>;
    var mFilter : ObjectFilter;
    var mGroupPath : GroupPath;

    public function new(inSvg:SVGData,?inLayer:String)
    {
       mSvg = inSvg;
       width = mSvg.width;
       height = mSvg.height;
       mRoot = mSvg;
       if (inLayer!=null)
       {
          mRoot = mSvg.findGroup(inLayer);
          if (mRoot==null)
             throw "Could not find SVG group: " + inLayer;
       }
    }

    public function iterate<T>(inGfx:T, ?inFilter:ObjectFilter) : T
    {
       mGfx = cast inGfx;
       mMatrix = new Matrix();
       mFilter = inFilter;
       mGroupPath = [];
       mGfx.size(width,height);
       iterateGroup(mRoot,true);
       mGfx.eof();
       return inGfx;
    }
    public function hasGroup(inName:String)
    {
        return mRoot.hasGroup(inName);
    }

    public function iterateText(inText:Text)
    {
       if (mFilter!=null && !mFilter(inText.name,mGroupPath))
          return;
       mGfx.renderText(inText);
    }

    public function iteratePath(inPath:Path)
    {
       if (mFilter!=null && !mFilter(inPath.name,mGroupPath))
          return;

       if (inPath.segments.length==0 || mGfx==null)
           return;
       var px = 0.0;
       var py = 0.0;

       var m:Matrix  = inPath.matrix.clone();
       m.concat(mMatrix);
       var context = new RenderContext(m,mScaleRect,mScaleW,mScaleH);

       var geomOnly = mGfx.geometryOnly();
       if (!geomOnly)
       {
          inPath.segments[0].toGfx(mGfx, context);

          switch(inPath.fill)
          {
             case FillGrad(grad):
                grad.updateMatrix(m);
                mGfx.beginGradientFill(grad);
             case FillSolid(colour):
                mGfx.beginFill(colour,inPath.fill_alpha*inPath.alpha);
             case FillNone:
                //mGfx.endFill();
          }


          if (inPath.stroke_colour==null)
          {
             //mGfx.lineStyle();
          }
          else
          {
             var style = new svg.gfx.LineStyle();
             var scale = Math.sqrt(m.a*m.a + m.c*m.c);
             style.thickness = inPath.stroke_width*scale;
             style.alpha = inPath.stroke_alpha*inPath.alpha;
             style.color = inPath.stroke_colour;
             style.capsStyle = inPath.stroke_caps;
             style.jointStyle = inPath.joint_style;
             style.miterLimit = inPath.miter_limit;
             mGfx.lineStyle(style);
          }
       }


       for(segment in inPath.segments)
          segment.toGfx(mGfx, context);

       mGfx.endFill();
       mGfx.endLineStyle();
    }



    public function iterateGroup(inGroup:Group,inIgnoreDot:Bool)
    {
       // Convention for hidden layers ...
       if (inIgnoreDot && inGroup.name!=null && inGroup.name.substr(0,1)==".")
          return;

       mGroupPath.push(inGroup.name);

       // if (mFilter!=null && !mFilter(inGroup.name)) return;

       for(child in inGroup.children)
       {
          switch(child)
          {
             case DisplayGroup(group):
                iterateGroup(group,inIgnoreDot);
             case DisplayPath(path):
                iteratePath(path);
             case DisplayText(text):
                iterateText(text);
          }
       }

       mGroupPath.pop();
    }





    public function render(?inMatrix:Matrix, ?inFilter:ObjectFilter, ?inScaleRect:Rectangle,?inScaleW:Float, ?inScaleH:Float )
    {
    
       //mGfx = new format.gfx.GfxGraphics(inGfx);
       if (inMatrix==null)
          mMatrix = new Matrix();
       else
          mMatrix = inMatrix.clone();

       mScaleRect = inScaleRect;
       mScaleW = inScaleW;
       mScaleH = inScaleH;
       mFilter = inFilter;
       mGroupPath = [];

       iterateGroup(mRoot,inFilter==null);
    }


    public function renderRect(inFilter:ObjectFilter,scaleRect:Rectangle,inBounds:Rectangle,inRect:Rectangle) : Void
    {
       var matrix = new Matrix();
       matrix.tx = inRect.x-(inBounds.x);
       matrix.ty = inRect.y-(inBounds.y);
       if (scaleRect!=null)
       {
          var extraX = inRect.width-(inBounds.width-scaleRect.width);
          var extraY = inRect.height-(inBounds.height-scaleRect.height);
          render(matrix,inFilter,scaleRect, extraX, extraY );
       }
       else
         render(matrix,inFilter);
    }

    public function renderRect0(inFilter:ObjectFilter,scaleRect:Rectangle,inBounds:Rectangle,inRect:Rectangle) : Void
    {
       var matrix = new Matrix();
       matrix.tx = -(inBounds.x);
       matrix.ty = -(inBounds.y);
       if (scaleRect!=null)
       {
          var extraX = inRect.width-(inBounds.width-scaleRect.width);
          var extraY = inRect.height-(inBounds.height-scaleRect.height);
          render(matrix,inFilter,scaleRect, extraX, extraY );
       }
       else
         render(matrix,inFilter);
    }




    public function getExtent(?inMatrix:Matrix, ?inFilter:ObjectFilter, ?inIgnoreDot:Bool ) :
        Rectangle
    {
       if (inIgnoreDot==null)
          inIgnoreDot = inFilter==null;
       var gfx = new svg.gfx.GfxExtent();
       mGfx = gfx;
       if (inMatrix==null)
          mMatrix = new Matrix();
       else
          mMatrix = inMatrix.clone();

       mFilter = inFilter;
       mGroupPath = [];

       iterateGroup(mRoot,inIgnoreDot);

       return gfx.extent;
    }

    public function findText(?inFilter:ObjectFilter)
    {
       mFilter = inFilter;
       mGroupPath = [];
       var finder = new svg.gfx.GfxTextFinder();
       mGfx = finder;
       iterateGroup(mRoot,false);
       return finder.text;
    }

    public function getMatchingRect(inMatch:EReg) : Rectangle
    {
       return getExtent(null, function(_,groups) {
          return groups[1]!=null && inMatch.match(groups[1]);
       }, false  );
    }


}

