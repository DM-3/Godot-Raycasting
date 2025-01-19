#include "ray_t.gdshaderinc"

bool rayBoxIntersectRel(const vec3 relPos, const vec3 boxSize, const vec3 rayInvDir, out float distance)
{
    vec3 bot = rayInvDir * (relPos - .5 * boxSize);
    vec3 top = rayInvDir * (relPos + .5 * boxSize);

    vec4 t;

    vec3 tmin = min(top, bot);
    t.rg = max(tmin.xx, tmin.yz);
    t.b = max(t.r, t.g);
    distance = t.b;
    
    vec3 tmax = max(top, bot);
    t.rg = min(tmax.xx, tmax.yz);
    t.a = min(t.r, t.g);

    return t.a > max(t.b, 0.0);
}

bool rayBoxIntersect(const vec3 boxPos, const vec3 boxSize, const Ray ray, out float distance)
{
    return rayBoxIntersectRel(boxPos - ray.origin, boxSize, ray.invDir, distance);
}
