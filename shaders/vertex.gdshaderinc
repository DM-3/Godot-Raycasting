// variables to query from vertex to fragment shader
varying flat vec3 _rayOrigin;
varying vec3 _rayDir;

// per vertex shader
void vertex()
{
    VERTEX = (MODELVIEW_MATRIX * vec4(VERTEX, 1.)).xyz;
    _rayOrigin = (INV_VIEW_MATRIX * vec4(0, 0, 0, 1)).xyz;
    _rayDir = (INV_VIEW_MATRIX * vec4(VERTEX, 1.)).xyz - _rayOrigin;
}
