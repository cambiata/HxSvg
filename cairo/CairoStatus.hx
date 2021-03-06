package cairo;

@:enum abstract CairoStatus(Int) {
    var SUCCESS = 0;
    var NO_MEMORY = 1;
    var INVALID_RESTORE = 2;
    var INVALID_POP_GROUP = 3;
    var NO_CURRENT_POINT = 4;
    var INVALID_MATRIX = 5;
    var INVALID_STATUS = 6;
    var NULL_POINTER = 7;
    var INVALID_STRING = 8;
    var INVALID_PATH_DATA = 9;
    var READ_ERROR = 10;
    var WRITE_ERROR = 11;
    var SURFACE_FINISHED = 12;
    var SURFACE_TYPE_MISMATCH = 13;
    var PATTERN_TYPE_MISMATCH = 14;
    var INVALID_CONTENT = 15;
    var INVALID_FORMAT = 16;
    var INVALID_VISUAL = 17;
    var FILE_NOT_FOUND = 18;
    var INVALID_DASH = 19;
    var INVALID_DSC_COMMENT = 20;
    var INVALID_INDEX = 21;
    var CLIP_NOT_REPRESENTABLE = 22;
    var TEMP_FILE_ERROR = 23;
    var INVALID_STRIDE = 24;
    var FONT_TYPE_MISMATCH = 25;
    var USER_FONT_IMMUTABLE = 26;
    var USER_FONT_ERROR = 27;
    var NEGATIVE_COUNT = 28;
    var INVALID_CLUSTERS = 29;
    var INVALID_SLANT = 30;
    var INVALID_WEIGHT = 31;
    var INVALID_SIZE = 32;
    var USER_FONT_NOT_IMPLEMENTED = 33;
    var DEVICE_TYPE_MISMATCH = 34;
    var DEVICE_ERROR = 35;
    var LAST_STATUS = 36;
}
