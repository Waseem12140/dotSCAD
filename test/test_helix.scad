use <unittest.scad>;
use <helix.scad>;

module test_helix_the_same_radius() {
    echo("==== test_helix_the_same_radius ====");

    $fn = 12;

    expected = [[40, 0, 0], [34.641, -20, 0.8333], [20, -34.641, 1.6667], [0, -40, 2.5], [-20, -34.641, 3.3333], [-34.641, -20, 4.1667], [-40, 0, 5], [-34.641, 20, 5.8333], [-20, 34.641, 6.6667], [0, 40, 7.5], [20, 34.641, 8.3333], [34.641, 20, 9.1667], [40, 0, 10], [34.641, -20, 10.8333], [20, -34.641, 11.6667], [0, -40, 12.5], [-20, -34.641, 13.3333], [-34.641, -20, 14.1667], [-40, 0, 15], [-34.641, 20, 15.8333], [-20, 34.641, 16.6667], [0, 40, 17.5], [20, 34.641, 18.3333], [34.641, 20, 19.1667], [40, 0, 20], [34.641, -20, 20.8333], [20, -34.641, 21.6667], [0, -40, 22.5], [-20, -34.641, 23.3333], [-34.641, -20, 24.1667], [-40, 0, 25], [-34.641, 20, 25.8333], [-20, 34.641, 26.6667], [0, 40, 27.5], [20, 34.641, 28.3333], [34.641, 20, 29.1667], [40, 0, 30], [34.641, -20, 30.8333], [20, -34.641, 31.6667], [0, -40, 32.5], [-20, -34.641, 33.3333], [-34.641, -20, 34.1667], [-40, 0, 35], [-34.641, 20, 35.8333], [-20, 34.641, 36.6667], [0, 40, 37.5], [20, 34.641, 38.3333], [34.641, 20, 39.1667], [40, 0, 40], [34.641, -20, 40.8333], [20, -34.641, 41.6667], [0, -40, 42.5], [-20, -34.641, 43.3333], [-34.641, -20, 44.1667], [-40, 0, 45], [-34.641, 20, 45.8333], [-20, 34.641, 46.6667], [0, 40, 47.5], [20, 34.641, 48.3333], [34.641, 20, 49.1667], [40, 0, 50], [34.641, -20, 50.8333], [20, -34.641, 51.6667], [0, -40, 52.5], [-20, -34.641, 53.3333], [-34.641, -20, 54.1667], [-40, 0, 55], [-34.641, 20, 55.8333], [-20, 34.641, 56.6667], [0, 40, 57.5], [20, 34.641, 58.3333], [34.641, 20, 59.1667], [40, 0, 60], [34.641, -20, 60.8333], [20, -34.641, 61.6667], [0, -40, 62.5], [-20, -34.641, 63.3333], [-34.641, -20, 64.1667], [-40, 0, 65], [-34.641, 20, 65.8333], [-20, 34.641, 66.6667], [0, 40, 67.5], [20, 34.641, 68.3333], [34.641, 20, 69.1667], [40, 0, 70], [34.641, -20, 70.8333], [20, -34.641, 71.6667], [0, -40, 72.5], [-20, -34.641, 73.3333], [-34.641, -20, 74.1667], [-40, 0, 75], [-34.641, 20, 75.8333], [-20, 34.641, 76.6667], [0, 40, 77.5], [20, 34.641, 78.3333], [34.641, 20, 79.1667], [40, 0, 80], [34.641, -20, 80.8333], [20, -34.641, 81.6667], [0, -40, 82.5], [-20, -34.641, 83.3333], [-34.641, -20, 84.1667], [-40, 0, 85], [-34.641, 20, 85.8333], [-20, 34.641, 86.6667], [0, 40, 87.5], [20, 34.641, 88.3333], [34.641, 20, 89.1667], [40, 0, 90], [34.641, -20, 90.8333], [20, -34.641, 91.6667], [0, -40, 92.5], [-20, -34.641, 93.3333], [-34.641, -20, 94.1667], [-40, 0, 95], [-34.641, 20, 95.8333], [-20, 34.641, 96.6667], [0, 40, 97.5], [20, 34.641, 98.3333], [34.641, 20, 99.1667], [40, 0, 100]];
    
    actual = helix(
        radius = 40, 
        levels = 10, 
        level_dist = 10, 
        vt_dir = "SPI_UP", 
        rt_dir = "CLK"
    );
    
    assertEqualPoints(expected, actual);
}

module test_helix_different_radiuses() {
    echo("==== test_helix_different_radiuses ====");

    $fn = 12;

    expected = [[40, 0, 0], [34.4967, -19.9167, 0.8333], [19.8333, -34.3523, 1.6667], [0, -39.5, 2.5], [-19.6667, -34.0637, 3.3333], [-33.9193, -19.5833, 4.1667], [-39, 0, 5], [-33.6307, 19.4167, 5.8333], [-19.3333, 33.4863, 6.6667], [0, 38.5, 7.5], [19.1667, 33.1976, 8.3333], [33.0533, 19.0833, 9.1667], [38, 0, 10], [32.7646, -18.9167, 10.8333], [18.8333, -32.6203, 11.6667], [0, -37.5, 12.5], [-18.6667, -32.3316, 13.3333], [-32.1873, -18.5833, 14.1667], [-37, 0, 15], [-31.8986, 18.4167, 15.8333], [-18.3333, 31.7543, 16.6667], [0, 36.5, 17.5], [18.1667, 31.4656, 18.3333], [31.3213, 18.0833, 19.1667], [36, 0, 20], [31.0326, -17.9167, 20.8333], [17.8333, -30.8882, 21.6667], [0, -35.5, 22.5], [-17.6667, -30.5996, 23.3333], [-30.4552, -17.5833, 24.1667], [-35, 0, 25], [-30.1666, 17.4167, 25.8333], [-17.3333, 30.0222, 26.6667], [0, 34.5, 27.5], [17.1667, 29.7335, 28.3333], [29.5892, 17.0833, 29.1667], [34, 0, 30], [29.3005, -16.9167, 30.8333], [16.8333, -29.1562, 31.6667], [0, -33.5, 32.5], [-16.6667, -28.8675, 33.3333], [-28.7232, -16.5833, 34.1667], [-33, 0, 35], [-28.4345, 16.4167, 35.8333], [-16.3333, 28.2902, 36.6667], [0, 32.5, 37.5], [16.1667, 28.0015, 38.3333], [27.8572, 16.0833, 39.1667], [32, 0, 40], [27.5685, -15.9167, 40.8333], [15.8333, -27.4241, 41.6667], [0, -31.5, 42.5], [-15.6667, -27.1355, 43.3333], [-26.9911, -15.5833, 44.1667], [-31, 0, 45], [-26.7024, 15.4167, 45.8333], [-15.3333, 26.5581, 46.6667], [0, 30.5, 47.5], [15.1667, 26.2694, 48.3333], [26.1251, 15.0833, 49.1667], [30, 0, 50], [25.8364, -14.9167, 50.8333], [14.8333, -25.6921, 51.6667], [0, -29.5, 52.5], [-14.6667, -25.4034, 53.3333], [-25.2591, -14.5833, 54.1667], [-29, 0, 55], [-24.9704, 14.4167, 55.8333], [-14.3333, 24.8261, 56.6667], [0, 28.5, 57.5], [14.1667, 24.5374, 58.3333], [24.393, 14.0833, 59.1667], [28, 0, 60], [24.1044, -13.9167, 60.8333], [13.8333, -23.96, 61.6667], [0, -27.5, 62.5], [-13.6667, -23.6714, 63.3333], [-23.527, -13.5833, 64.1667], [-27, 0, 65], [-23.2383, 13.4167, 65.8333], [-13.3333, 23.094, 66.6667], [0, 26.5, 67.5], [13.1667, 22.8053, 68.3333], [22.661, 13.0833, 69.1667], [26, 0, 70], [22.3723, -12.9167, 70.8333], [12.8333, -22.228, 71.6667], [0, -25.5, 72.5], [-12.6667, -21.9393, 73.3333], [-21.795, -12.5833, 74.1667], [-25, 0, 75], [-21.5063, 12.4167, 75.8333], [-12.3333, 21.362, 76.6667], [0, 24.5, 77.5], [12.1667, 21.0733, 78.3333], [20.9289, 12.0833, 79.1667], [24, 0, 80], [20.6403, -11.9167, 80.8333], [11.8333, -20.4959, 81.6667], [0, -23.5, 82.5], [-11.6667, -20.2073, 83.3333], [-20.0629, -11.5833, 84.1667], [-23, 0, 85], [-19.7742, 11.4167, 85.8333], [-11.3333, 19.6299, 86.6667], [0, 22.5, 87.5], [11.1667, 19.3412, 88.3333], [19.1969, 11.0833, 89.1667], [22, 0, 90], [18.9082, -10.9167, 90.8333], [10.8333, -18.7639, 91.6667], [0, -21.5, 92.5], [-10.6667, -18.4752, 93.3333], [-18.3309, -10.5833, 94.1667], [-21, 0, 95], [-18.0422, 10.4167, 95.8333], [-10.3333, 17.8979, 96.6667], [0, 20.5, 97.5], [10.1667, 17.6092, 98.3333], [17.4648, 10.0833, 99.1667], [20, 0, 100]];
    
    actual = helix(
        radius = [40, 20], 
        levels = 10, 
        level_dist = 10, 
        vt_dir = "SPI_UP", 
        rt_dir = "CLK"
    );

    assertEqualPoints(expected, actual);
}

test_helix_the_same_radius();
test_helix_different_radiuses();