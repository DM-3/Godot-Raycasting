#include "res://shaders/ray_t.gdshaderinc"
#include "res://shaders/hitInfo_t.gdshaderinc"
#include "res://shaders/object_t.gdshaderinc"

uniform int _maxGravitySteps = 70;

bool gravityLenseHit(const HitInfo hitInfo, inout Ray ray)
{
	Object obj = _objects[hitInfo.objectIndex];
	ray.origin = hitInfo.point - obj.transform[3].xyz;
	
	float lsqr = dot(ray.origin, ray.origin);
	int steps = 0;
	do
	{
		float l = sqrt(lsqr);
		ray.direction = normalize(ray.direction - ray.origin / (2200.0 * lsqr * l));
		ray.origin += ray.direction * 0.1 * l;
		lsqr = dot(ray.origin, ray.origin);
	}
	while (
		++steps < _maxGravitySteps && 
		lsqr < obj.shapeVars.x * obj.shapeVars.x);
	
	ray.color *= vec3(float(steps != _maxGravitySteps));
	
	return steps != _maxGravitySteps;
}
