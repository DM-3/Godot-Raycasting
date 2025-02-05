#include "vertex.gdshaderinc"
#include "trace.gdshaderinc"

const int nRaysPerPixel = 1;

void fragment()
{
    Ray ray;
    ray.origin = _rayOrigin;
    ray.direction = normalize(_rayDir);
	ray.color = vec3(1.0);
	ray.light = vec3(0.0);

    // trace rays from camera through scene
    vec3 incomingLight = vec3(0);
    for (int i = 0; i < nRaysPerPixel; i++)
        incomingLight += trace(ray);

	ALBEDO = incomingLight / float(nRaysPerPixel);
}
