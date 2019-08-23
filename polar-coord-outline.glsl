#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

float near(in float threshold, in float val) {
  return 1. - step(0.07, abs(threshold - val));
}

void main(void) {
  vec2 p =
    (gl_FragCoord.xy * 2. - u_resolution)
    / min(u_resolution.x, u_resolution.y);

  float arg = atan(p.y, p.x) + u_time * 0.3;
  float r = 0.8 * abs(cos(4. * arg));

  float periodic = abs(cos(u_time * 0.2));
  float red = clamp(3. * periodic - 2., 0., 1.);
  float green = clamp(-3. * periodic + 2., 0., 1.);
  float blue = clamp(3. * periodic, 0., 1.);
  vec3 baseColor = vec3(red, blue, green);

  float len = length(p);
  gl_FragColor =
    vec4(vec3(near(r, len) * baseColor * len * 2.5), 1.);
}
