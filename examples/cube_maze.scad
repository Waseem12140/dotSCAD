include <line2d.scad>;
include <square_maze.scad>;

maze_rows = 8;
block_width = 2;
wall_thickness = 1;
inner_cube = false;
travel_all = true;

module cube_maze(maze_rows, block_width, wall_thickness, inner_cube, travel_all) {
    blocks_size = block_width * maze_rows;
    cube_size = blocks_size - wall_thickness;
    maze_size = blocks_size + wall_thickness;
    
    half_wall_thickness = wall_thickness / 2;
    half_cube_size = cube_size / 2;
    half_maze_size = maze_size / 2;
    
    origin = half_wall_thickness - half_maze_size;
    
    module two_mazes() {
        translate([origin, origin, half_cube_size]) 
            linear_extrude(wall_thickness) build_square_maze(
                maze_rows, 
                maze_rows, 
                go_maze(
                    1, 1,   // starting point
                    starting_maze(maze_rows, maze_rows),  
                    maze_rows, maze_rows
                ), 
                block_width, 
                wall_thickness
            );
            
        rotate([180, 0, 0]) 
            translate([origin, origin, half_cube_size]) 
                linear_extrude(wall_thickness) build_square_maze(
                    maze_rows, 
                    maze_rows, 
                    go_maze(
                        1, 1,   // starting point
                        starting_maze(maze_rows, maze_rows),  
                        maze_rows, maze_rows
                    ), 
                    block_width, 
                    wall_thickness
                );       
    }
    
    if(inner_cube) {
        cube(cube_size + 0.01, center= true);
    }

    difference() {
        union() {
            two_mazes();
            rotate([90, 0, 0]) two_mazes();
            rotate([0, 90, 0]) two_mazes();
        }
    
        if(travel_all) {
            union() {
                translate([half_maze_size - wall_thickness * 2, -half_maze_size, half_cube_size]) 
                    cube(wall_thickness);
            
                translate([half_maze_size - wall_thickness, half_maze_size - wall_thickness * 2, half_cube_size]) 
                    cube(wall_thickness);   
                
                translate([half_maze_size - wall_thickness, half_maze_size - wall_thickness, -half_cube_size]) 
                    cube(wall_thickness);
                
                translate([-half_maze_size + wall_thickness, half_maze_size - wall_thickness, -half_cube_size - wall_thickness]) 
                    cube(wall_thickness);

                translate([-half_maze_size, -half_maze_size + wall_thickness, -half_cube_size - wall_thickness]) 
                    cube(wall_thickness);        
        
                translate([-half_maze_size, -half_maze_size, half_cube_size - wall_thickness])
                    cube(wall_thickness);  
            }
        }        
    }
}

cube_maze(maze_rows, block_width, wall_thickness, inner_cube, travel_all);
