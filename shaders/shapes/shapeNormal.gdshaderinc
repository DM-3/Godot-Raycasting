#include "res://shaders/object_t.gdshaderinc"

vec3 shapeNormal(const int objectIndex, const vec3 hitPoint)
{
    Object obj = _objects[objectIndex];
    switch (obj.shapeType)
    {
        case 0: return normalize(hitPoint - obj.transform[3].xyz);
        case 1:
            vec3 relPos = hitPoint - obj.transform[3].xyz;
            return sign(relPos) * step(-1e-5, abs(relPos) - 0.5 * obj.shapeVars.xyz);
        default: return vec3(1.0, 0.0, 0.0);
    }
}
