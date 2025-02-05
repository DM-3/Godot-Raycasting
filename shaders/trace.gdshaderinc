#include "findClosestHit.gdshaderinc"
#include "surfaces/surfaceHit.gdshaderinc"
#include "environment.gdshaderinc"

uniform int _nMaxBounces = 5;

vec3 trace(Ray ray)
{
	int hits = 0;
	bool continueTrace;
	do
    {
        HitInfo hitInfo = findClosestHit(ray);
        if (hitInfo.objectIndex == -1)
			break;
		
		continueTrace = surfaceHit(hitInfo, ray);
    }
    while (++hits <= _nMaxBounces && continueTrace);
	
    return ray.light + environment_dir(ray.direction) * ray.color + vec3(1e-5);
}
