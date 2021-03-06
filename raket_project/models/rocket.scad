$fn = 150;

/* Øverste del af raket */
translate([40, 0, 0]) union() {
    cylinder(h=15, r=10); /* Lille monterings studs */
    translate([0, 0, 15]) cylinder(h=10, r=12); /* Stor krop */
    translate([0, 0, 10 + 15]) cylinder(h=40, r1=12, r2=0); /* Kegle */
}

difference() {
    union() {
        /* Create the main body */
        cylinder(h = 100, r=12);
        
        for (i=[1:3]) {
            /* Create the fins */
            rotate([0, 0, i*360/3]) union() {
                translate([-6.7, 0, 23.5]) rotate([0, 45, 0]) translate([0, -1, 0]) cube([25, 2, 20]);
                translate([0, -1, 0]) cube([25, 2, 20]);
            }
            
            /* Create the guide hoops */
            rotate([0, 0, i*360 / 3 + 60]) translate([15, 0, 0]) difference() {
                cylinder(h=5, d=8);
                translate([0, 0, -0.5]) cylinder(h=6, d=5);
            }
        }
    }
    
    /* Remove some material to allow the insertion of the cap */
    translate([0, 0, 100-15]) cylinder(h= 16, r=10);
    
    /* Remove extra material so we can insert the catridge */
    translate([0, 0, 80]) cylinder(h=25, d=20);
    
    /* CO2 Catridge */
    translate([0, 0, 83]) rotate([180, 0, 0]) union() {
        cylinder(h = 63, d=20);
        translate([0, 0, 63]) cylinder(h = 16, d1=19, d2=8.5);
        translate([0, 0, 63+16]) cylinder(h=7, d=8.5);
    }
}
