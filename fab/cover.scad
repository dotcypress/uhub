$fn=128;
epsilon=0.01;

module usb() {
  hull() {
    translate([3, 0, 0])
      cylinder(r=1.9, h=20, center=true);
    translate([-3, 0, 0])
      cylinder(r=1.9, h=20, center=true);
  }
}

module cover() {
  difference() {
    union() {
      cube(size=[58, 9.5, 1], center=true);
      translate([0, 0, 1])
        cube(size=[55, 9.5, 1.8], center=true);
    }
    translate([-19.2, 1.7, 0]) usb();
    translate([0, 1.7, 0]) usb();
    translate([19.2, 1.7, 0]) usb();
  }
}

module print() {
  translate([10, 4, 0.5]) 
    cube(size=[1, 88, 1], center=true);
  translate([-10, 4, 0.5]) 
    cube(size=[1, 88, 1], center=true);
  for (i=[-3:4]) {
    translate([0, i*12, 0.6]) cover();
  }
}

// print();
cover();