#include "object_t.gdshaderinc"
#include "ray_t.gdshaderinc"
#include "hitInfo_t.gdshaderinc"
#include "rayBoxIntersect.gdshaderinc"

HitInfo findClosestHit(Ray ray)
{
    HitInfo closestHit = HitInfo(1e20, -1, vec3(0.0));

    for (int i = 0; i < _nObjects; i++)
    {
        Object obj = _objects[i];

        vec3 d = obj.transform[3].xyz - ray.origin;

        // TODO: filter objects based on direction

        // ignore objects further away than the current closest intersection
        if (length(d) - obj.boundingVolume.w > closestHit.distance)
            continue;

        // ignore objects whose bounding box is not intersected
        float dist;
        if (!rayBoxIntersectRel(d, obj.boundingVolume.xyz, ray.invDir, dist))
            continue;

        // TODO: check intersection against actual shape
        HitInfo hit = HitInfo(dist, i, vec3(0.0));

        if (hit.distance < closestHit.distance)
            closestHit = hit;
    }

    closestHit.point = ray.origin + ray.direction * closestHit.distance;
    return closestHit;
}
