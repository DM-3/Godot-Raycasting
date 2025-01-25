#include "ray_t.gdshaderinc"

bool raySphereIntersectRel(const vec3 relPos, const float radius, const vec3 rayDir, out float distance)
{
	float p = dot(rayDir, relPos);
	float radicand = p * p - dot(relPos, relPos) + radius * radius;
	radicand = sqrt(radicand);
	distance = max(p - radicand, 0.0);
	return p > -radicand;
}

bool raySphereIntersect(const vec3 spherePos, const float radius, const Ray ray, out float distance)
{
	return raySphereIntersectRel(spherePos - ray.origin, radius, ray.direction, distance);
}
