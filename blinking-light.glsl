precision mediump float;
uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

void main(void) {
  vec2 p = (gl_FragCoord.xy * 2. - u_resolution) / min(u_resolution.x, u_resolution.y);
  float l = 0.1 / length(p) * sin(u_time * 3.5);
  gl_FragColor = vec4(l, 0., 0., 1);
}
