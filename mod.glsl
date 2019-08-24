#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

void main(void) {
  vec2 p =
    (gl_FragCoord.xy * 2. - u_resolution)
    / min(u_resolution.x, u_resolution.y);
  vec2 q = mod(p, 0.2);
  gl_FragColor = vec4(vec3(q.x, q.y, q.y), 1.);
}
