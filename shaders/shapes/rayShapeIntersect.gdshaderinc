#include "res://shaders/ray_t.gdshaderinc"
#include "res://shaders/object_t.gdshaderinc"
#include "res://shaders/raySphereIntersect.gdshaderinc"
#include "res://shaders/rayBoxIntersect.gdshaderinc"

bool rayShapeIntersect(const int objectIndex, const Ray ray, inout float dist)
{
	Object obj = _objects[objectIndex];
	switch (obj.shapeType)
	{
		case 0: return raySphereIntersect(obj.transform[3].xyz, obj.shapeVars.x, ray, dist);
		case 1: return rayBoxIntersect(obj.transform[3].xyz, obj.shapeVars.xyz, ray, dist);
		default: return false;
	}
}
