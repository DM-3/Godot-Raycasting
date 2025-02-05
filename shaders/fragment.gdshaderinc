#include "vertex.gdshaderinc"
#include "trace.gdshaderinc"

uniform int nRaysPerPixel = 1;

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
	{
		ray.direction = normalize(ray.direction + vec3(ivec3(i % 2, i / 2 % 2, i / 4 % 2)) * 0.0002);
        incomingLight += trace(ray);
	}

	ALBEDO = incomingLight / float(nRaysPerPixel);
}
