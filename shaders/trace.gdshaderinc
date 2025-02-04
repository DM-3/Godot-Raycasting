#include "findClosestHit.gdshaderinc"
#include "surfaces/surfaceHit.gdshaderinc"

uniform int _nMaxBounces = 5;
uniform vec3 _environmentLight : source_color = vec3(0.53, 0.81, 0.92);

vec3 trace(Ray ray)
{
	vec3 incomingLight = vec3(0);
	vec3 rayColor = vec3(1);

	int hits = 0;
	bool continueTrace;
	do
    {
        HitInfo hitInfo = findClosestHit(ray);
        if (hitInfo.objectIndex == -1)
			break;
		
		vec3 surfaceColor;
		continueTrace = surfaceHit(hitInfo, ray, surfaceColor);
		rayColor *= surfaceColor;
		incomingLight += vec3(1e-5);
    }
    while (++hits <= _nMaxBounces && continueTrace);
	
    return float(hits != 0) * (incomingLight + _environmentLight * rayColor);
}
