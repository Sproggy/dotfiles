static const char norm_fg[] = "#c2c4c6";
static const char norm_bg[] = "#0c151b";
static const char norm_border[] = "#5b666f";

static const char sel_fg[] = "#c2c4c6";
static const char sel_bg[] = "#2593A8";
static const char sel_border[] = "#c2c4c6";

static const char urg_fg[] = "#c2c4c6";
static const char urg_bg[] = "#5A768A";
static const char urg_border[] = "#5A768A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
