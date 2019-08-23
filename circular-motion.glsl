#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;  // time
uniform vec2  u_resolution;  // resolution

void main(void){
  // 画面中央を原点とする座標系での描画位置
  vec2 p = (gl_FragCoord.xy * 2. - u_resolution) / min(u_resolution.x, u_resolution.y);

  float periodic = abs(cos(u_time * 0.2));

  float red = clamp(3. * periodic - 2., 0., 1.);
  float green = clamp(-3. * periodic + 2., 0., 1.);
  float blue = clamp(3. * periodic, 0., 1.);

  vec3 baseColor = vec3(red, blue, green) / 25.;

  vec3 destColor = vec3(0.);

  // 5つの点に対しての処理
  for (int i = 0; i < 5; i++) {
    // 個々にスピードを変える
    float speed = float(i + 1);
    // 画面中央を中心として回転する点の座標
    vec2 q = p + vec2(cos(u_time * speed), sin(u_time * speed)) * 0.7;
    // 描画位置の色を，点qと原点の距離に応じて変化
    destColor += baseColor / length(q);
  }

  gl_FragColor = vec4(destColor, 1);
}
