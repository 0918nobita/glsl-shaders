#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

void main(void) {
  vec2 p =
    (gl_FragCoord.xy * 2. - u_resolution)
    / min(u_resolution.x, u_resolution.y);
  vec2 q = mod(p, 0.2) - 0.1;
  float c = cos(u_time);
  float s = sin(u_time);
  q = mat2(c, s, -s, c) * q;
  float f = 0.1 / abs(q.x) * abs(q.y);
  gl_FragColor = vec4(vec3(f), 1.);
}
