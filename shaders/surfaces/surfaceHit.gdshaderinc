#include "res://shaders/shapes/shapeNormal.gdshaderinc"
#include "2_gravityLense.gdshaderinc"

bool surfaceHit(HitInfo hitInfo, inout Ray ray)
{
	Object obj = _objects[hitInfo.objectIndex];
	
	if (obj.surfaceType == 2)
		return gravityLenseHit(hitInfo, ray);
	
	bool reflective = obj.surfaceType == 0;
	
    vec3 normal = shapeNormal(hitInfo.objectIndex, hitInfo.point);

    ray.color *= obj.color * (reflective ? 1.0 : clamp(dot(-ray.direction, normal), 0.0, 1.0));
	ray.direction = reflect(ray.direction, normal);
    ray.origin = hitInfo.point + normal * 1e-4;

	return reflective;
}
