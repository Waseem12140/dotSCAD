to_do:

- doc: sf, stereographic_extrude add convexity

new:

- maze/mz_wang_tiles?

- mz_hamiltonian supports init_cells

   update doc mz_square_initialize

- surface/sf_cylinder?
- noise/worley_sphere?
- voronoi/vrn_sphere?
- t3d - roll/pitch/forward
- polyline_join: doc multi-childs

- util/count
- lemniscate_curve?
- perlin_sphere?

- rands_disk, rands_sphere?

- m_replace?

- lsystem2, lsystem3, add seed param

deprecated:
    rails2sections: use m_transpose

doc-ed

    deprecated:
    - util/sort, util/bsearch, util/has
    - maze/mz_square_cells, maze/mz_theta_cells, maze/mz_square_walls, maze/mz_hex_walls

    new:
    - util/sorted, util/binary_search, util/contains
    - maze/mz_square, maze/mz_theta, maze/mz_squarewalls, maze/mz_hexwalls
    
