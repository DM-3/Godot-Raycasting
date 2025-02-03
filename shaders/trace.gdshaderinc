#include "findClosestHit.gdshaderinc"
#include "surfaces/surfaceHit.gdshaderinc"

uniform int _nMaxBounces = 5;
uniform vec3 _environmentLight : source_color = vec3(0.53, 0.81, 0.92);

vec3 trace(Ray ray)
{
	vec3 incomingLight = vec3(0);
	vec3 rayColor = vec3(1);

    for (int i = 0; i <= _nMaxBounces; i++)
    {
        HitInfo hitInfo = findClosestHit(ray);
        if (hitInfo.objectIndex == -1)
        {
			incomingLight += float(i != 0) * _environmentLight * rayColor;
            break;
        }
		
		vec3 surfaceColor = surfaceHit(hitInfo, ray);
		rayColor *= surfaceColor;
		incomingLight += vec3(1e-5);
    }
	
    return incomingLight;
}
