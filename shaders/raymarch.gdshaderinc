#include "shapes/shapeSDF.gdshaderinc"

uniform float _maxMarchDistance = 2.0;
uniform float _marchHitDistance = 0.001;
uniform int _maxMarchSteps = 70;

bool raymarch(const vec3 pos, const int shapeType, const vec4 shapeVars, const vec3 rayDir, inout float dist)
{
	float startDist = dist;
	float d;
	int steps = 0;
	do
	{
		d = shapeSDF(pos + dist * rayDir, shapeType, shapeVars);
		dist += d * 0.99;
	}
	while (
		++steps < _maxMarchSteps && 
		d > _marchHitDistance && 
		dist - startDist < _maxMarchDistance);
	
	return d < _marchHitDistance || steps == _maxMarchSteps;
}
