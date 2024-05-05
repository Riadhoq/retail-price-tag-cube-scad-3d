use <fontmetrics.scad>;

resolution = 10; //[10, 20, 30, 50, 100]

fontExtrude = 1;
message = "$123";
fontSize = 7;
fontFamily = "Arial";
letterSpacing = .9;
sidePadding = 1;

length = measureText(message, font=fontFamily, size=fontSize, spacing=letterSpacing) + sidePadding;

depth = 8;
height = 9;

$fn = resolution;
union() {
    linear_extrude(fontExtrude, true) {
    translate([0, 0]) text(message, fontSize, fontFamily, halign = "center", valign="center", spacing = letterSpacing);
} 
difference() {
    translate([0, 0, -depth/2]) cube([length, height, depth], center = true);
    
    translate([0, -depth -0.38, -depth ]) rotate([45]) cube([length + 2, height, depth * 2], center = true);
}
}



// Written by Riadul Hoque <hoqueriadul@gmail.com>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
