#include "trace.gdshaderinc"


const int nRaysPerPixel = 1;

void fragment()
{
    Ray ray;
    ray.origin = _rayOrigin;
    ray.direction = normalize(_rayDir);
    ray.invDir = vec3(1.0) / ray.direction;

    // trace rays from camera through scene

    vec3 incomingLight = vec3(0);
    for (int i = 0; i < nRaysPerPixel; i++)
        incomingLight += trace(ray);


    // no hits
    if (incomingLight == vec3(0))
        discard;

	ALBEDO = incomingLight / float(nRaysPerPixel);

    // cast ray from hit object to light source

    //float depth = 1.0;
    //vec4 viewSpaceHitPoint = VIEW_MATRIX * vec4(hitInfo.point, 1.);
    //vec4 clipSpaceHitPoint = PROJECTION_MATRIX * viewSpaceHitPoint;
    //depth = clipSpaceHitPoint.z / clipSpaceHitPoint.w;
    //DEPTH = depth < 0.0 ? 1.0 : depth;
}
