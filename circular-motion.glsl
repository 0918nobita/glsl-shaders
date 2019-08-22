precision mediump float;
uniform float t;       // time
uniform vec2  r;       // resolution

void main(void){
  // 画面中央を原点とする座標系での描画位置
  vec2 p = (gl_FragCoord.xy * 2. - r) / min(r.x, r.y);

  float periodic = abs(cos(t * 0.2));

  float red = 0.;
  float green = 0.;
  float blue = 0.;

  if (periodic > 2. / 3.) {
    red = (periodic - (2. / 3.)) * 3.;
    blue = 1.;
  } else if (periodic > 1. / 3.) {
    green = 1. - (periodic - (1. / 3.)) * 3.;
    blue = 1.;
  } else {
    blue = periodic * 3.;
    green = 1.;
  }

  vec3 destColor = vec3(0.);

  // 5つの点に対しての処理
  for (int i = 0; i < 5; i++) {
    // 個々にスピードを変える
    float speed = float(i + 1);
    // 画面中央を中心として回転する点の座標
    vec2 q = p + vec2(cos(t * speed), sin(t * speed)) * 0.6;
    // 描画位置の色を，点qと原点の距離に応じて変化
    destColor += vec3(red, blue, green) / 25. / length(q);
  }

  gl_FragColor = vec4(destColor, 1);
}
