#include "findClosestHit.gdshaderinc"

void fragment()
{
    Ray ray;
    ray.origin = _rayOrigin;
    ray.direction = normalize(_rayDir);
    ray.invDir = vec3(1.0) / ray.direction;

    // cast ray from camera into scene
    HitInfo hitInfo = findClosestHit(ray);

    // no hit
    if (hitInfo.objectIndex < 0)
        discard;

	ALBEDO = vec3(1.0) / hitInfo.distance;

    // cast ray from hit object to light source

    float depth = 1.0;
    vec4 viewSpaceHitPoint = VIEW_MATRIX * vec4(hitInfo.point, 1.);
    vec4 clipSpaceHitPoint = PROJECTION_MATRIX * viewSpaceHitPoint;
    depth = clipSpaceHitPoint.z / clipSpaceHitPoint.w;

    DEPTH = depth < 0.0 ? 1.0 : depth;
}
