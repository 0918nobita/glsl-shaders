precision mediump float;
uniform float t;  // time
uniform vec2  r;  // resolution

void main(void) {
  vec2 p = (gl_FragCoord.xy * 2. - r) / min(r.x, r.y);
  float l = 0.1 / length(p) * sin(t * 3.5);
  gl_FragColor = vec4(l, 0., 0., 1);
}
