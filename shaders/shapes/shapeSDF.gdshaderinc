#include "0_sphere.gdshaderinc"
#include "1_box.gdshaderinc"
#include "2_mengerSponge.gdshaderinc"

float shapeSDF(vec3 relPos, int shapeType, vec4 shapeVars)
{
	switch (shapeType)
	{
		case 0: return sphereSDF_rel(relPos, shapeVars.w);
		case 1: return boxSDF_rel(relPos, shapeVars.xyz);
		case 2: return mengerSpongeSDF_rel(relPos, shapeVars);
		default: return 0.0;
	}
}
