#include "object_t.gdshaderinc"
#include "ray_t.gdshaderinc"
#include "hitInfo_t.gdshaderinc"
#include "rayBoxIntersect.gdshaderinc"
#include "raySphereIntersect.gdshaderinc"
#include "shapes/rayShapeIntersect.gdshaderinc"

HitInfo findClosestHit(const Ray ray)
{
    HitInfo closestHit = _defaultHitInfo;

    for (int i = 0; i < _nObjects; i++)
    {
        Object obj = _objects[i];

        vec3 d = obj.transform[3].xyz - ray.origin;

        // TODO: filter objects based on direction

        // ignore objects further away than the current closest intersection
        if (length(d) - obj.boundingVolume.w > closestHit.distance)
            continue;

        float dist;

        // ignore objects whose bounding volume is not intersected
		if (!raySphereIntersectRel(d, obj.boundingVolume.w, ray.direction, dist) || dist > closestHit.distance)
			continue;

        // check intersection against objects actual shape
		if (!rayShapeIntersect(i, ray, dist) || dist > closestHit.distance)
			continue;

        closestHit = HitInfo(dist, i, vec3(0.0), vec3(0.0));
    }

    closestHit.point = ray.origin + ray.direction * closestHit.distance;
    return closestHit;
}
