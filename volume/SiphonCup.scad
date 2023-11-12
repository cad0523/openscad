CROSS_SECTION = true;
RESOLUTION = 0.20;

module u_pipe() {
    rotate_extrude(angle=180) {
        translate([10, 0, 0])
        circle(5);
    }
}

module pipes() {
    rotate([90, 0, 0])
    translate([10, 0, 0])
    cylinder(150, 5, 5);

    rotate([90, 0, 0])
    translate([-10, 0, 0])
    cylinder(110, 5, 5);
}

module elbow() {
    rotate_extrude(angle=90) {
        translate([10, 0, 0])
        circle(5);
    }
}

module pipe() {
    rotate([90, 0, 0])
    translate([0, 0, -20])
    cylinder(170, 20, 20);
}

module inner_path() {
    union() {
        u_pipe();
        pipes();
        translate([-20, -110, 0])
        rotate([0, 0, -90])
        elbow();
    }
}

module siphon() {
    difference() {
        pipe();
        inner_path();
    }
}

module outer() {
    rotate([90, 0, 0])
    translate([0, 0, -150])
    cylinder(300, 150, 100);
}

module inner() {
    rotate([90, 0, 0])
    translate([0, 0, -155])
    cylinder(280, 130, 80);
}

module cup() {
    difference() {
        outer();
        inner();
    }
}

module cup_hole() {
    difference() {
        cup();
        rotate([90, 0, 0])
        translate([10, 0, 120])
        cylinder(30, 5, 5);
    }
}

union() {
    cup_hole();
    siphon();
}

