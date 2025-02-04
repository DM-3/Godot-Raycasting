#include "findClosestHit.gdshaderinc"
#include "surfaces/surfaceHit.gdshaderinc"

uniform int _nMaxBounces = 5;
uniform vec3 _environmentLight : source_color = vec3(0.53, 0.81, 0.92);

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
	
    return float(hits != 0) * (ray.light + _environmentLight * ray.color + vec3(1e-5));
}
