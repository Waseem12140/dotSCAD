/**
* mz_hamiltonian.scad
*
* @copyright Justin Lin, 2020
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib3x-mz_hamiltonian.html
*
**/

use <../__comm__/_pt2_hash.scad>;
use <_impl/_mz_hamiltonian_impl.scad>;
use <mz_square_cells.scad>;
use <mz_square_initialize.scad>;
use <mz_square_get.scad>;
use <../util/set/hashset.scad>;
use <../util/set/hashset_elems.scad>;

function mz_hamiltonian(rows, columns, start = [0, 0], init_cells, seed) =
    let(
        init_cells_undef = is_undef(init_cells),
        r = init_cells_undef ? rows : len(init_cells),
        c = init_cells_undef ? columns : len(init_cells[0]),
        cells = mz_square_cells(
            r, c,
            init_cells = init_cells,
            start = start,
            seed = seed
        ),
        all = concat(
            [
                for(cell = cells)
                let(type = mz_square_get(cell, "t"))
                each if(type == "TOP_WALL") _mz_hamiltonian_top(cell.x, cell.y) else
                     if(type == "RIGHT_WALL") _mz_hamiltonian_right(cell.x, cell.y) else
                     if(type == "TOP_RIGHT_WALL" || type == "MASK") _mz_hamiltonian_top_right(cell.x, cell.y) 
            ],
            [for(x = [0:c * 2 - 1]) [x, 0]],
            [for(y = [0:r * 2 - 1]) [0, y]]
        ),
        
        dot_pts = hashset_elems(
            hashset(
                all, 
                hash = function(p) _pt2_hash(p)
            )
        ),
        falseRow = [for(c = [0:c * 2]) false],
        falseM = [for(r = [0:r * 2]) falseRow],
        dotM = dot_m(dot_pts, len(dot_pts), falseM),

        path_leng = init_cells_undef ? r * c : 
            len([for(row = init_cells, cell = row) if(mz_square_get(cell, "t") != "MASK") undef])
    )
    _mz_hamiltonian_travel(dotM, start * 2, path_leng * 4);