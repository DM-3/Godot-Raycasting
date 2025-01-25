struct Object
{
    mat4 transform;
    vec4 boundingVolume;    // axis-aligned bounding box sizes x y z, bounding sphere radius w
    int shapeType;
	vec4 shapeVars;
    int surfaceType;
	vec3 color;
};

const int _nObjects = 3;
const Object _objects[_nObjects] = { 
	Object(
		mat4(1.0), 
		vec4(1.0), 
		1, 
		vec4(1.0),
		0,
		vec3(1.0, 0.1, 0.1)
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
	)
};
