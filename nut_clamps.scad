include <MCAD/nuts_and_bolts.scad>
$fn=100;

height = 20;
bolt_size = 4; // options are M3 = 3, M4 = 4, M5 = 5
captive_size = 3; // options  M3 = 3, M4 = 4, M5 = 5

translate([0,-20,0])
top_brace(height,bolt_size,captive_size); // arguments are (height,bolt size,captive nut size)

bottom_brace(height,bolt_size); // arguments are (height,bolt size,captive nut size)

module fillet(rad,height){

difference(){
translate([0,0,-height/2]) cube([rad-0.05,rad-0.05,height]);
cylinder(h=height+1,r=rad,center=true);
}}

module top_brace(height,bolt,capnut,tol=0.25){
difference(){
union(){
difference(){

union(){
cube([20+3*bolt+10,14,height],center=true);

translate([-10.4,-9.9,0])
rotate([0,0,0])
fillet(3,20);

translate([10.4,-9.9,0])
rotate([0,0,90])
fillet(3,20);}

translate([0,2.5+0.01,0])
cube([20,9,height+0.1],center=true);

if (bolt == 5){
rotate([-90,0,0])
translate([10+bolt/2+2+2*tol,0,-3])
boltHole(bolt,units="MM",length=30,tolerance=tol);

rotate([-90,0,0])
translate([-10-bolt/2-2-2*tol,0,-3])
boltHole(bolt,units="MM",length=30,tolerance=tol);
} else if (bolt == 4) {
rotate([-90,0,0])
translate([10+bolt/2+2+2*tol,0,-4])
boltHole(bolt,units="MM",length=30,tolerance=tol);

rotate([-90,0,0])
translate([-10-bolt/2-2-2*tol,0,-4])
boltHole(bolt,units="MM",length=30,tolerance=tol);
} else if (bolt == 3){
rotate([-90,0,0])
translate([10+bolt/2+2+2*tol,0,-4.5])
boltHole(bolt,units="MM",length=30,tolerance=tol);

rotate([-90,0,0])
translate([-10-bolt/2-2-2*tol,0,-4.5])
boltHole(bolt,units="MM",length=30,tolerance=tol);}}

translate([0,-8.5-0.1,0])
cube([15,8,height],center=true);

}

for (i = [0:1:height/2]){
translate([0,0,i])
rotate([-90,0,0])
rotate([0,0,90])
translate([0,0,-10])
nutHole(capnut,units="MM",length=30,tolerance=0.25);}

translate([0,-15,0])
rotate([-90,0,0])
boltHole(capnut,units="MM",length=30,tolerance=tol);
}}

module bottom_brace(height,bolt,tol=0.25){
union(){
difference(){
cube([20+3*bolt+10,14,height],center=true);
translate([0,2.5+0.01,0])
cube([20,9,height+0.1],center=true);


rotate([-90,0,0])
translate([10+bolt/2+2+2*tol,0,-15])
boltHole(bolt,units="MM",length=30,tolerance=tol);

rotate([-90,0,0])
translate([-10-bolt/2-2-2*tol,0,-15])
boltHole(bolt,units="MM",length=30,tolerance=tol);


if (bolt == 5){

translate([-10-bolt/2-2-2*tol,-3,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);

translate([10+bolt/2+2+2*tol,-3,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);

} else if (bolt == 4) {

translate([-10-bolt/2-2-2*tol,-4,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);

translate([10+bolt/2+2+2*tol,-4,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);

} else if (bolt == 3) {

translate([-10-bolt/2-2-2*tol,-4.5,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);

translate([10+bolt/2+2+2*tol,-4.5,0])
rotate([90,0,0])
rotate([0,0,90])
nutHole(bolt,units="MM",tolerance=tol);
}}

translate([0,-0.1,0])
cube([5,5,height],center=true);
}}
