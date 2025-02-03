#include "res://shaders/ray_t.gdshaderinc"

float sphereSDF_rel(const vec3 relPos, float radius)
{
	return length(relPos) - radius;
}

float sphereSDF(const vec3 pos, const vec4 sphere)
{
	return distance(pos, sphere.xyz) - sphere.w;
}

bool raySphereIntersect_rel(const vec3 relPos, const float radius, const vec3 rayDir, out float dist)
{
	float p = dot(rayDir, relPos);
	float radicand = p * p - dot(relPos, relPos) + radius * radius;
	radicand = sqrt(radicand);
	dist = -min(p + radicand, 0.0);
	return p < radicand;
}

bool raySphereIntersect(const vec3 spherePos, const float radius, const Ray ray, out float dist)
{
	return raySphereIntersect_rel(ray.origin - spherePos, radius, ray.direction, dist);
}
