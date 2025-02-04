#include "res://shaders/object_t.gdshaderinc"
#include "res://shaders/raymarch.gdshaderinc"
#include "0_sphere.gdshaderinc"
#include "1_box.gdshaderinc"

bool rayShapeIntersect(const int objectIndex, const Ray ray, inout float dist)
{
	Object obj = _objects[objectIndex];
	vec3 relPos = ray.origin - obj.transform[3].xyz;
	switch (obj.shapeType)
	{
		case 0: return raySphereIntersect_rel(relPos, obj.shapeVars.x, ray.direction, dist);
		case 1: return rayBoxIntersect_rel(relPos, obj.shapeVars.xyz, ray.direction, dist);
		case 2: 
			return raymarch(relPos, obj.shapeType, obj.shapeVars, ray.direction, dist);
		default: return false;
	}
}
