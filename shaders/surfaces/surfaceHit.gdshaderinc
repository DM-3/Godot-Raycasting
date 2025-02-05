#include "res://shaders/shapes/shapeNormal.gdshaderinc"
#include "2_gravityLense.gdshaderinc"

uniform vec3 _ambientLight : source_color = vec3(0.63, 0.81, 0.92);

bool surfaceHit(HitInfo hitInfo, inout Ray ray)
{
	Object obj = _objects[hitInfo.objectIndex];
    vec3 normal = shapeNormal(hitInfo.objectIndex, hitInfo.point);
	
	switch (obj.surfaceType)
	{
		case 0:
			ray.color *= obj.color;
			ray.direction = reflect(ray.direction, normal);
			ray.origin = hitInfo.point + normal * 1e-4;
			return true;
		case 1:
			ray.light += ray.color * obj.color * clamp(dot(-ray.direction, normal), 0, 1) * _ambientLight;
			ray.color = vec3(0.0);
			return false;
		case 2: return gravityLenseHit(hitInfo, ray);
	};
}
