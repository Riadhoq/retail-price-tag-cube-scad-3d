// First example of parameteric model
//   
//    syntax: 
//        //Description
//        variable=value; //Parameter
//        
//        This type of comment tells the name of group to which parameters below
//        this comment will belong 
//    
//       /*[ group name ]*/ 
//
use <fontmetrics.scad>;

//Below comment tells the group to which a variable will belong
/*[ properties of Sign]*/

//The resolution of the curves. Higher values give smoother curves but may increase the model render time.
resolution = 10; //[10, 20, 30, 50, 100]

//The horizontal radius of the outer ellipse of the sign.
radius = 80;//[60 : 200]

//Total height of the sign
fontHeight = 1;//[1 : 10]

/*[ Content To be written ] */

message = "$123.123";
fontSize = 7;
fontFamily = "Arial";
letterSpacing = .9;
sidePadding = 1;

length = measureText(message, font=fontFamily, size=fontSize, spacing=letterSpacing) + sidePadding;

depth = 3;

height = 9;

//Message to be write 
Message = message ; //["Welcome to...", "Happy Birthday!", "Happy Anniversary", "Congratulations", "Thank You"]

//Name of Person, company etc.

$fn = resolution;
union() {
    linear_extrude(fontHeight, true) {
    translate([0, 0]) text(Message, fontSize, fontFamily, halign = "center", valign="center", spacing = letterSpacing);
} 
difference() {
    translate([0, 0, -depth/2]) cube([length, height, depth], center = true);
    
    translate([0, -depth -0.38, -depth ]) rotate([45]) cube([length + 2, height, depth * 2], center = true);

}
}



// Written by Amarjeet Singh Kapoor <amarjeet.kapoor1@gmail.com>
//
// To the extent possible under law, the author(s) have dedicated all
// copyright and related and neighboring rights to this software to the
// public domain worldwide. This software is distributed without any
// warranty.
//
// You should have received a copy of the CC0 Public Domain
// Dedication along with this software.
// If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.