x=65;
y=75;
cutoutZ=0.3;
bottom=0.3;
seam=2;

cube([x,y+10,bottom]);
difference(){
    cube([x,y,cutoutZ+bottom+0.3+0.05]);
    translate([seam,seam,bottom])
    cube([x-2*seam,y,cutoutZ]);
}
