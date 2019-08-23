#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

void main(void) {
  vec2 p = (gl_FragCoord.xy * 2. - u_resolution) / min(u_resolution.x, u_resolution.y);
  float top = step(0.1, 1. - p.y);
  float left = step(-0.9, p.x);
  float right = step(0.1, 1. - p.x);
  float bottom = step(-0.9, p.y);
  gl_FragColor = vec4(vec3(top * left * right * bottom), 1.);
}
