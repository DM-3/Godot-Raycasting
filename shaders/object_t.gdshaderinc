struct Object
{
    mat4 transform;
    vec4 boundingVolume;    // axis-aligned bounding box sizes x y z, bounding sphere radius w
    int shapeType;
    int surfaceType;
};

const int _nObjects = 2;
const Object _objects[_nObjects] = { 
	Object(
		mat4(1.0), 
		vec4(1.0), 
		0, 
		0
	),
	Object(
		mat4(1.0) + mat4(vec4(0), vec4(0), vec4(0), vec4(-1, .5, 1, 0)), 
		vec4(0.5), 
		0, 
		0
	)
};
