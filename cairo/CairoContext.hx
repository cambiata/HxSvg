package cairo;

@:access(cairo.CairoMatrix.handle)
@:access(cairo.CairoSurface.handle)
@:access(cairo.CairoPath.handle)
@:access(cairo.CairoPattern.handle)
class CairoContext {
	private var handle:Dynamic;

	public function new(handle:Dynamic) {
		this.handle = handle;
	}

	public function save() CairoRaw.cairo_save(this.handle);
	public function restore() CairoRaw.cairo_restore(this.handle);
	public function saveRestore(callback: Void -> Void) {
		save();
		try {
			callback();
			restore();
		} catch (e:Dynamic) {
			restore();
			throw e;
		}
	}
	
	public function setSource(source:CairoPattern) CairoRaw.cairo_set_source(this.handle, source.handle);
	public function setSourceRgb(r:Float, g:Float, b:Float) CairoRaw.cairo_set_source_rgb(this.handle, r, g, b);
	public function setSourceRgba(r:Float, g:Float, b:Float, a:Float) CairoRaw.cairo_set_source_rgba(this.handle, r, g, b, a);
	public function setSourceSurface(surface:CairoSurface, x:Float, y:Float) CairoRaw.cairo_set_source_surface(this.handle, surface.handle, x, y);

	public function getSource() return new CairoPattern(CairoRaw.cairo_get_source(this.handle));

	public function fill() CairoRaw.cairo_fill(this.handle);
	public function stroke() CairoRaw.cairo_stroke(this.handle);
	public function translate(dx:Float, dy:Float) CairoRaw.cairo_translate(this.handle, dx, dy);
	public function scale(sx:Float, sy:Float) CairoRaw.cairo_scale(this.handle, sx, sy);
	public function rotate(angle:Float) CairoRaw.cairo_rotate(this.handle, angle);
	public function identity() CairoRaw.cairo_identity_matrix(this.handle);

	public function moveTo(x:Float, y:Float) CairoRaw.cairo_move_to(this.handle, x, y);
	public function lineTo(x:Float, y:Float) CairoRaw.cairo_line_to(this.handle, x, y);

	public function arc(xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float) CairoRaw.cairo_arc(handle, xc, yc, radius, angle1, angle2);
	public function arcNegative(xc:Float, yc:Float, radius:Float, angle1:Float, angle2:Float) CairoRaw.cairo_arc_negative(handle, xc, yc, radius, angle1, angle2);
	public function curveTo(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float) CairoRaw.cairo_curve_to(handle, x1, y1, x2, y2, x3, y3);


	public function relMoveTo(x:Float, y:Float) CairoRaw.cairo_rel_move_to(this.handle, x, y);
	public function relLineTo(x:Float, y:Float) CairoRaw.cairo_rel_line_to(this.handle, x, y);
	public function relCurveTo(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float) CairoRaw.cairo_rel_curve_to(handle, x1, y1, x2, y2, x3, y3);

	public function rectangle(x:Float, y:Float, width:Float, height:Float) CairoRaw.cairo_rectangle(this.handle, x, y, width, height);
	public function transform(matrix:CairoMatrix) CairoRaw.cairo_transform(this.handle, matrix.handle);
	public function setMatrix(matrix:CairoMatrix) CairoRaw.cairo_set_matrix(this.handle, matrix.handle);
	public function getMatrix():CairoMatrix {
		var out = new CairoMatrix();
		CairoRaw.cairo_set_matrix(this.handle, out.handle);
		return out;
	}
	public function setFontMatrix(matrix:CairoMatrix) CairoRaw.cairo_set_font_matrix(handle, matrix.handle);
	public function getFontMatrix():CairoMatrix {
		var out = new CairoMatrix();
		CairoRaw.cairo_set_font_matrix(handle, out.handle);
		return out;
	}

	public function setFontOptions(value:CairoFontOptions):CairoContext {
		CairoRaw.cairo_set_font_options(handle, value);
		return this;
	}

	public function getFontOptions():CairoFontOptions {
		var out = CairoFontOptions.create();
		CairoRaw.cairo_set_font_options(handle, out);
		return out;
	}

	public function hasCurrentPoint() return CairoRaw.cairo_has_current_point(this.handle);
	public function getCurrentPoint():CairoPoint {
		var out = [0.0, 0.0];
		CairoRaw.cairo_get_current_point(this.handle, out);
		return new CairoPoint(out[0], out[1]);
	}
	public function getStatus() return cast(CairoRaw.cairo_status(handle), CairoStatus);
	public function getTarget():CairoSurface return new CairoSurface(CairoRaw.cairo_get_target(handle));

	public function setAntialias(value:CairoAntialias) CairoRaw.cairo_set_antialias(handle, value);
	public function getAntialias():CairoAntialias return cast(CairoRaw.cairo_get_antialias(handle), CairoAntialias);

	public function setFillRule(value:CairoFillRule) CairoRaw.cairo_set_fill_rule(handle, value);
	public function getFillRule():CairoFillRule return cast(CairoRaw.cairo_get_fill_rule(handle), CairoFillRule);

	public function setLineCap(value:CairoLineCap) CairoRaw.cairo_set_line_cap(handle, value);
	public function getLineCap():CairoLineCap return cast(CairoRaw.cairo_get_line_cap(handle), CairoLineCap);

	public function setLineJoin(value:CairoLineJoin) CairoRaw.cairo_set_line_join(handle, value);
	public function getLineJoin():CairoLineJoin return cast(CairoRaw.cairo_get_line_join(handle), CairoLineJoin);

	public function setLineWidth(value:Float) CairoRaw.cairo_set_line_width(handle, value);
	public function getLineWidth():Float return CairoRaw.cairo_get_line_width(handle);

	public function setMiterLimit(value:Float) CairoRaw.cairo_set_miter_limit(handle, value);
	public function getMiterLimit():Float return CairoRaw.cairo_get_miter_limit(handle);

	public function setTolerance(value:Float) CairoRaw.cairo_set_tolerance(handle, value);
	public function getTolerance():Float return CairoRaw.cairo_get_tolerance(handle);

	public function setOperator(op:CairoOperator) CairoRaw.cairo_set_operator(handle, op);
	public function getOperator():CairoOperator return cast(CairoRaw.cairo_get_operator(handle), CairoOperator);

	public function copyPage() CairoRaw.cairo_copy_page(handle);
	public function showPage() CairoRaw.cairo_show_page(handle);

	public function pushGroup() CairoRaw.cairo_push_group(handle);
	public function pushGroupWithContent(content:CairoContent) CairoRaw.cairo_push_group_with_content(handle, content);

	public function copyPath():CairoPath return new CairoPath(CairoRaw.cairo_copy_path(handle));
	public function copyPathFlat():CairoPath return new CairoPath(CairoRaw.cairo_copy_path_flat(handle));

	public function appendPath(path:CairoPath) CairoRaw.cairo_append_path(handle, path.handle);
	public function newPath() CairoRaw.cairo_new_path(handle);
	public function newSubPath() CairoRaw.cairo_new_sub_path(handle);
	public function closePath() CairoRaw.cairo_new_path(handle);

	public function popGroup() return new CairoPattern(CairoRaw.cairo_pop_group(handle));
	public function popToSource() CairoRaw.cairo_pop_group_to_source(handle);
	public function getGroupTarget() return new CairoSurface(CairoRaw.cairo_get_group_target(handle));

	public function fillPreserve() CairoRaw.cairo_fill_preserve(handle);

	public function getClipExtents() {
		var p1 = [0.0, 0.0];
		var p2 = [0.0, 0.0];
		CairoRaw.cairo_clip_extents(handle, p1, p2);
		return new CairoRectangle(p1[0], p1[1], p2[0], p2[1]);
	}

	public function getFillExtents() {
		var p1 = [0.0, 0.0];
		var p2 = [0.0, 0.0];
		CairoRaw.cairo_fill_extents(handle, p1, p2);
		return new CairoRectangle(p1[0], p1[1], p2[0], p2[1]);
	}

	public function getPathExtents() {
		var p1 = [0.0, 0.0];
		var p2 = [0.0, 0.0];
		CairoRaw.cairo_path_extents(handle, p1, p2);
		return new CairoRectangle(p1[0], p1[1], p2[0], p2[1]);
	}

	public function getStrokeExtents() {
		var p1 = [0.0, 0.0];
		var p2 = [0.0, 0.0];
		CairoRaw.cairo_stroke_extents(handle, p1, p2);
		return new CairoRectangle(p1[0], p1[1], p2[0], p2[1]);
	}

	private function _transformPoint(point:CairoPoint, handler: Array<Float> -> Void) {
		var p = [point.x, point.y];
		handler(p);
		return new CairoPoint(p[0], p[1]);
	}

	public function userToDevice(point:CairoPoint):CairoPoint {
		return _transformPoint(point, function(p) CairoRaw.cairo_user_to_device(handle, p));
	}

	public function userToDeviceDistance(point:CairoPoint):CairoPoint {
		return _transformPoint(point, function(p) CairoRaw.cairo_user_to_device_distance(handle, p));
	}

	public function deviceToUser(point:CairoPoint):CairoPoint {
		return _transformPoint(point, function(p) CairoRaw.cairo_device_to_user(handle, p));
	}

	public function deviceToUserDistance(point:CairoPoint):CairoPoint {
		return _transformPoint(point, function(p) CairoRaw.cairo_device_to_user_distance(handle, p));
	}

	public function clip() CairoRaw.cairo_clip(handle);
	public function clipPreserve() CairoRaw.cairo_clip_preserve(handle);
	public function resetClip() CairoRaw.cairo_reset_clip(handle);

	public function inClip(x:Float, y:Float):Bool return CairoRaw.cairo_in_clip(handle, x, y);
	public function inFill(x:Float, y:Float):Bool return CairoRaw.cairo_in_fill(handle, x, y);
	public function inStroke(x:Float, y:Float):Bool return CairoRaw.cairo_in_stroke(handle, x, y);

	public function mask(pattern:CairoPattern) CairoRaw.cairo_mask(handle, pattern.handle);
	public function maskSurface(surface:CairoSurface, x:Float, y:Float) CairoRaw.cairo_mask_surface(handle, surface.handle, x, y);

	public function paint() CairoRaw.cairo_paint(handle);
	public function paintWithAlpha(alpha:Float) CairoRaw.cairo_paint_with_alpha(handle, alpha);

	public function selectFontFace(family:String, slant:CairoFontSlant, weight:CairoFontWeight) {
		CairoRaw.cairo_select_font_face(handle, family, slant, weight);
	}

	public function setFontSize(size:Float) CairoRaw.cairo_set_font_size(handle, size);
	public function showText(text:String) CairoRaw.cairo_show_text(handle, text);

	/**
	 * Adds closed paths for text to the current path. The generated path if filled, achieves an effect similar to that of cairo_show_text().
	 */
	public function textPath(text:String) CairoRaw.cairo_text_path(handle, text);

	//public function getDashCount():Int return CairoRaw.cairo_get_dash_count(handle);
	public function setDashes(dashes:Array<Float>, offset:Float):CairoContext {
		CairoRaw.cairo_set_dash(handle, dashes, dashes.length, offset);
		return this;
	}

	public function getDashes(): { dashes: Array<Float>, offset:Float } {
		var count:Int = CairoRaw.cairo_get_dash_count(handle);
		var dashes = [for (n in 0 ... count) 0.0];
		var offsetPtr = [0.0];
		CairoRaw.cairo_get_dash(handle, dashes, offsetPtr);
		return {
			dashes: dashes,
			offset: offsetPtr[0]
		}
	}
}
