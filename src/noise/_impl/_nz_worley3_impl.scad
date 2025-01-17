use <_nz_worley_comm.scad>;

function _neighbors(fcord, seed, grid_w, gwv) = 
    let(range = [-1:1])
    [
        for(z = range, y = range, x = range)
        let(
            cord = [x, y, z] + fcord,
            sds = rands(0, 1, 3, cord * gwv + seed)
        )
        (cord + sds) * grid_w
    ];

function _nz_worley3(p, seed, grid_w, dist) = 
    let(
        fcord = [floor(p.x / grid_w), floor(p.y / grid_w), floor(p.z / grid_w)],
        gwv = [1, grid_w, grid_w ^ 2],
        nbrs = _neighbors(fcord, seed, grid_w, gwv)
    )
    dist == "euclidean" ? _nz_worley_euclidean(p, nbrs) :
    dist == "manhattan" ? _nz_worley_manhattan(p, nbrs) :
    dist == "chebyshev" ? _nz_worley_chebyshev(p, nbrs) : 
    dist == "border"    ? _nz_worley_border(p, nbrs) :
    assert("Unknown distance option");

function _nz_worley3s(points, seed, grid_w, dist) = 
    let(
        noise = dist == "euclidean" ? function(p, nbrs) _nz_worley_euclidean(p, nbrs) :
                dist == "manhattan" ? function(p, nbrs) _nz_worley_manhattan(p, nbrs) :
                dist == "chebyshev" ? function(p, nbrs) _nz_worley_chebyshev(p, nbrs) : 
                dist == "border"    ? function(p, nbrs) _nz_worley_border(p, nbrs) :
                assert("Unknown distance option"),
        gwv = [1, grid_w, grid_w ^ 2]
    )
    [
        for(p = points)
        let(
            fcord = [floor(p.x / grid_w), floor(p.y / grid_w), floor(p.z / grid_w)],
            nbrs = _neighbors(fcord, seed, grid_w, gwv)
        )
        noise(p, nbrs)
    ];