shader_type spatial;

render_mode
    depth_draw_always,
    cull_front,
    skip_vertex_transform,
    shadows_disabled,
    unshaded,
    ambient_light_disabled;

#include "vertex.gdshaderinc"
#include "fragment.gdshaderinc"
