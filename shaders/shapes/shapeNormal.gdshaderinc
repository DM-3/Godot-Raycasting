#include "res://shaders/object_t.gdshaderinc"
#include "shapeSDF.gdshaderinc"

vec3 shapeNormal(const int objectIndex, const vec3 hitPoint)
{
    Object obj = _objects[objectIndex];
    switch (obj.shapeType)
    {
        case 0: return normalize(hitPoint - obj.transform[3].xyz);
        case 1:
            vec3 relPos = hitPoint - obj.transform[3].xyz;
            return sign(relPos) * step(-1e-5, abs(relPos) - obj.shapeVars.xyz);
		case 2:
			float baseDist = shapeSDF(hitPoint, obj.shapeType, obj.shapeVars);
			const vec2 epsilon = vec2(.0001, 0);
		    vec3 dirDist = vec3(
		        shapeSDF(hitPoint - epsilon.xyy, obj.shapeType, obj.shapeVars),
		        shapeSDF(hitPoint - epsilon.yxy, obj.shapeType, obj.shapeVars),
		        shapeSDF(hitPoint - epsilon.yyx, obj.shapeType, obj.shapeVars));
		    return normalize(baseDist - dirDist);
			
        default: return vec3(1.0, 0.0, 0.0);
    }
}
