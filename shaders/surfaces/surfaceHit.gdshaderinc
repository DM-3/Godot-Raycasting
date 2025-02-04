#include "res://shaders/ray_t.gdshaderinc"
#include "res://shaders/object_t.gdshaderinc"
#include "res://shaders/hitInfo_t.gdshaderinc"
#include "res://shaders/shapes/shapeNormal.gdshaderinc"

bool surfaceHit(HitInfo hitInfo, inout Ray ray, out vec3 color)
{
	Object obj = _objects[hitInfo.objectIndex];
	bool reflective = obj.surfaceType == 0;
	
    vec3 normal = shapeNormal(hitInfo.objectIndex, hitInfo.point);

    color = obj.color * (reflective ? 1.0 : clamp(dot(-ray.direction, normal), 0.0, 1.0));
    
	ray.direction = reflect(ray.direction, normal);
    ray.invDir = vec3(1.0) / ray.direction;
    ray.origin = hitInfo.point + normal * 1e-4;

	return reflective;
}
