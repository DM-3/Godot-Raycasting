#include "res://shaders/ray_t.gdshaderinc"

float boxSDF_rel(const vec3 relPos, const vec3 boxSize)
{
	return length(max(abs(relPos) - boxSize, 0.0));
}

float boxSDF(const vec3 pos, const vec3 boxPos, const vec3 boxSize)
{
	return length(max(abs(pos - boxPos) - boxSize, 0.0));
}

bool rayBoxIntersect_rel(const vec3 relPos, const vec3 boxSize, const vec3 rayDir, out float dist)
{
	vec3 bot = -(relPos + boxSize) / rayDir;
	vec3 top = -(relPos - boxSize) / rayDir;

    vec4 t;
	t.xyz = min(top, bot);
	dist = max(max(0.0, t.x), max(t.y, t.z));
	
	t.xyz = max(top, bot);
	t.w = min(t.x, min(t.y, t.z));
	
	return t.w > dist;
}

bool rayBoxIntersect(const vec3 boxPos, const vec3 boxSize, const Ray ray, out float dist)
{
    return rayBoxIntersect_rel(ray.origin - boxPos, boxSize, ray.direction, dist);
}
