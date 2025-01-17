use <shape_pentagram.scad>;
use <path_extrude.scad>;
use <torus_knot.scad>;

p = 2;
q = 3;
phi_step = 0.05;
star_radius = 0.5;

pts = torus_knot(p, q, phi_step);

shape_pentagram_pts = shape_pentagram(star_radius);

path_extrude(
    shape_pentagram_pts, 
    [each pts, pts[0]], 
    closed = true,
    method = "EULER_ANGLE"
);
