struct HitInfo
{
    float distance;
    int objectIndex;
    vec3 point;
	vec3 normal;
};

const HitInfo _defaultHitInfo = HitInfo(1e20, -1, vec3(0), vec3(0));
