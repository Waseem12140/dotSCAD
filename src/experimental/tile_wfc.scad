use <_impl/_tiles_wfc_impl.scad>;
use <../util/rand.scad>;

// An implementation of [Wave Function Collapse](https://github.com/mxgmn/WaveFunctionCollapse)
function tile_wfc(size, sample) =
    let(
        w = size.x,
        h = size.y,
        nbr_dirs = [
            for(y = [0:h - 1])
            [for(x = [0:w - 1]) neighbor_dirs(x, y, w, h)]
        ],
        tm = tilemap(w, h, sample),
        // random start
        x = floor(rand(w * 0.25, w * 0.75)),
        y = floor(rand(h * 0.25, h * 0.75)),
		compatibilities = tilemap_compatibilities(tm),
        wf = tilemap_wf(tm),
        all_weights = wf_weights(wf),
        states = wf_eigenstates_at(wf, x, y),
		weights = [for(state = states) get_state_weight(all_weights, state)],
        first_collasped_propagated = propagate(
			nbr_dirs,
			compatibilities,
			wf_collapse(wf, x, y, weights), 
            [x, y]
        ),
        notCollapsedCoords = wf_not_collapsed_coords(first_collasped_propagated)
    )
    generate(nbr_dirs, compatibilities, first_collasped_propagated, notCollapsedCoords);

/*

sample = [
    ["S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S"],
    ["S",  "S", "C0", "CN", "CN", "CN", "CN", "CN", "CN", "CN", "C3",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],
    ["S",  "S", "CW",  "L",  "L",  "L",  "L",  "L",  "L",  "L", "CE",  "S",  "S"],    
    ["S",  "S", "C1", "CS", "CS", "CS", "CS", "CS", "CS", "CS", "C2",  "S",  "S"],
    ["S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S",  "S"]
];

size = [20, 20];

echo(tile_wfc(size, sample));
*/


