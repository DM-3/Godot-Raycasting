
float mengerSpongeSDF_rel(vec3 relPos, const vec4 sizes)
{
	float d = length(max(abs(relPos) - vec3(sizes.x), 0.0));
	float s = 1.0 / sizes.x;
	for (float m = 0.0; m < sizes.w; m++, s *= 3.0)
	{
	    vec3 a = mod(relPos * s, 2.0) - 1.0;
	    vec3 r = abs(0.333333 - abs(a)) - 0.333333;
		
		vec4 t;
		t.xyz = max(r.xyz, r.yzx);
	    t.w = min(t.x, min(t.y, t.z)) / s;

	    d = max(d, t.w);
	}
	return d;
}
