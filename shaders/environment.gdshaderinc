uniform sampler2D source_panorama : filter_linear, source_color, hint_default_black;

vec3 environment_dir(vec3 dir)
{
    // Spherically map UVs
	float u = 0.5 * atan(-dir.x, dir.z) / (3.14159) + 0.5;
	float v = acos(dir.y) / (3.14159);
	
	return texture(source_panorama, vec2(u, v)).rgb;
}
