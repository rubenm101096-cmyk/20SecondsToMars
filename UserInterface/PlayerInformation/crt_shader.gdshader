shader_type canvas_item;

uniform float scanlines_1 = 200.;
uniform float scanlines_2 = 15.;
uniform float scan_reduction = .1;
uniform float blur: hint_range(0.0, 5.0, 0.1) = 0.35;
uniform float diffusion = 0.05;
uniform float vinnette_alpla: hint_range(0.0, 1.0, 0.01) = 1.0;
uniform float vinnette_inner_radius = 3.5;

float random(vec2 uv) {
	return fract(sin(dot(uv.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void fragment() {
	vec2 uv_scan1 = vec2(UV.x, UV.y + TIME);
	vec2 uv_scan2 = vec2(UV.x, UV.y + TIME * .4);

	// Sprite's own texture instead of the screen
	vec4 tex = textureLod(TEXTURE, UV, blur);

	float scanlines1 = sin(uv_scan1.y * scanlines_1) * scan_reduction - scan_reduction;
	float scanlines2 = sin(uv_scan2.y * scanlines_2) * scan_reduction - scan_reduction;

	float vx = abs(UV.x - .5) * 2.0;
	float vy = abs(UV.y - .5) * 2.0;
	float vq = 1.0 - (1.0 - sqrt(vx * vx + vy * vy) / vinnette_inner_radius);
	tex.rgb -= vec3(vq * vinnette_alpla);

	tex.rgb += vec3(scanlines1 + scanlines2 + diffusion);

	COLOR = tex; // alpha is preserved, so transparent areas stay transparent
}