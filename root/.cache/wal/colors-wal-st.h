const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c151b", /* black   */
  [1] = "#5A768A", /* red     */
  [2] = "#2593A8", /* green   */
  [3] = "#718D9C", /* yellow  */
  [4] = "#9EA0A3", /* blue    */
  [5] = "#97A6AB", /* magenta */
  [6] = "#D5AB9D", /* cyan    */
  [7] = "#c2c4c6", /* white   */

  /* 8 bright colors */
  [8]  = "#5b666f",  /* black   */
  [9]  = "#5A768A",  /* red     */
  [10] = "#2593A8", /* green   */
  [11] = "#718D9C", /* yellow  */
  [12] = "#9EA0A3", /* blue    */
  [13] = "#97A6AB", /* magenta */
  [14] = "#D5AB9D", /* cyan    */
  [15] = "#c2c4c6", /* white   */

  /* special colors */
  [256] = "#0c151b", /* background */
  [257] = "#c2c4c6", /* foreground */
  [258] = "#c2c4c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
