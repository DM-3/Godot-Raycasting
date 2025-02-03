#include "res://shaders/ray_t.gdshaderinc"
#include "res://shaders/object_t.gdshaderinc"
#include "res://shaders/hitInfo_t.gdshaderinc"
#include "res://shaders/shapes/shapeNormal.gdshaderinc"

vec3 surfaceHit(HitInfo hitInfo, inout Ray ray)
{
    vec3 normal = shapeNormal(hitInfo.objectIndex, hitInfo.point);
    ray.direction = reflect(ray.direction, normal);
    ray.invDir = vec3(1.0) / ray.direction;
    ray.origin = hitInfo.point + normal * 1e-3;

    return _objects[hitInfo.objectIndex].color;
}
