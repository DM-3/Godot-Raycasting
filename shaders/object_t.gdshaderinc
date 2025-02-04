struct Object
{
    mat4 transform;

	// axis-aligned bounding box sizes x y z, bounding sphere radius w
    vec4 boundingVolume;    
    
	// shape type that together with shapeVars defines object's shape
	// 	0: sphere, 			radius = shapeVars.w
	// 	1: box, 			dimensions = shapeVars.xyz
	// 	2: menger sponge, 	dimensions = shapeVars.xyz, hole ratio = shapeVars.w
	int shapeType;

	vec4 shapeVars;
    
	// 0: reflective
	// 1: diffuse
	int surfaceType;

	vec3 color;
};

const int _nObjects = 4;
const Object _objects[_nObjects] = { 
	Object(
		mat4(1.0), 
		vec4(sqrt(0.75)), 
		2, 
		vec4(0.5, 0.5, 0.5, 4),
		1,
		vec3(0.9, 0.1, 0.1)
	),
	Object(
		mat4(1.0) + mat4(vec4(0), vec4(0), vec4(0), vec4(-1, .5, 1, 0)), 
		vec4(0.5), 
		0,
		vec4(0.5),
		0,
		vec3(0.5, 1.0, 0.3)
	),
	Object(
		mat4(1.0) + mat4(vec4(0), vec4(0), vec4(0), vec4(0.2, -0.1, 1, 0)),
		vec4(0.3),
		0,
		vec4(0.3),
		0,
		vec3(0.3, 0.5, 1.0)
	),
	Object(
		mat4(1.0) + mat4(vec4(0), vec4(0), vec4(0), vec4(0, -1, 0, 0)),
		vec4(sqrt(75.0)),
		1,
		vec4(5.0, 0.05, 5.0, 0.0),
		0,
		vec3(0.9, 0.9, 0.9)
	)
};
