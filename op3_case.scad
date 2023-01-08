use<op3_v2.scad>;

$fn=65;

phone=[153.1, 75.3, 7.8];
op_camera=[25, 18, 5];

phone_height=0.76;
case_thickness=1.4;

case=[4, 4, case_thickness+0.48];
case_rounding=4;
case_rounding_sphere=2;



case_hole_bot_loc=[case[0]+phone[1]/10, 9*phone[1]/10-2*case[0], 7];
case_hole_bot=[1,5];


clearance_phone=phone;
clearance_height=3;
clearance_rounding=0;
s_scale=[1,1,1];

topZ=0.6;

hingeX=phone[2]+1.5;
hingeXAdditional=40;
hingeXOffset=5;
hingeZ=0.3;
//hingeZSeam=0.4;
//hingeZSeamY=1;

OVERLAP=0.01;

x=65;
y=75;
cutoutZ=0.15;
//bottom=0.0;
seam=2;
creditCardHolderTop=0.3;
zOffset=0+cutoutZ+creditCardHolderTop;
creditCardHolderStartOffset=case_rounding;
extraYOffset=3;

rotate([0,0,-90]){        
    difference(){
        union(){
            translate([0,0,-0.01])
            op3_case();

            top();

            hinge();
        }
        translate([0,case_rounding_sphere/2,-1])
    cube([200,0.005,5]);
        translate([0,-hingeX-hingeXOffset-case_rounding*0.5,-1])
    cube([200,0.005,5]);
        translate([18,case_rounding_sphere/2+1.1,-1])
    cube([47.5,0.005,6]);
        translate([phone[0]/2,-hingeX-hingeXOffset,-OVERLAP])
        cube([0.005,hingeX+hingeXOffset,5]);
    }
}

module top(){
    translate([case_rounding*1.5,-phone[1]-hingeX,0])
    difference(){
        minkowski(){
            cube([phone[0]-2*1.5*case_rounding-case_rounding_sphere+case[0],phone[1]-2*1.5*case_rounding+case[0],topZ]);
            cylinder(r=case_rounding*1.5,h=case_rounding);
        }
        translate([-case_rounding*1.5-OVERLAP/2,-case_rounding*1.5-OVERLAP/2,topZ])
        cube([phone[0]+OVERLAP+case_rounding_sphere,phone[1]+OVERLAP+case[0],100]);
    }
    
    color([0.8,0.4,0.4])
    {
//    creditCardHolder(0,30+2*extraYOffset,0,0);
//    creditCardHolder(0,15+extraYOffset,1*zOffset,1);
//    creditCardHolder(0,0,2*zOffset,2);
        
    creditCardHolder(0,15+extraYOffset,0,0);
    creditCardHolder(0,0,1*zOffset,1);
    }  
}

module creditCardHolder(bottomThickness=0,yOffset=0,zOffset=0,number=0){
    translate([phone[0]-y-yOffset-number*extraYOffset-creditCardHolderStartOffset,-phone[1]-hingeX,topZ+zOffset])
    {
        cube([y,x,bottomThickness]);
        difference(){
            cube([y,x,cutoutZ+bottomThickness+creditCardHolderTop]);
            translate([-OVERLAP-15,seam,bottomThickness])
            cube([y-seam+15,x-2*seam,cutoutZ]);
        }
    }
        
    translate([phone[0]-yOffset-number*extraYOffset-creditCardHolderStartOffset,-phone[1]-hingeX,topZ+zOffset])
    cube([yOffset,x,cutoutZ+bottomThickness+creditCardHolderTop]);
}

module hinge(){
    translate([case_rounding_sphere+hingeXOffset/2,-hingeX-hingeXAdditional/2,0])
    {
        cube([phone[0]-case_rounding_sphere-hingeXOffset,hingeX+hingeXAdditional,hingeZ]);
    }
   
}

module op3_case()
{
	difference()
	{		
		translate([case_rounding_sphere, case_rounding_sphere, case_rounding_sphere])
			translate([case_rounding, case_rounding, 0])
			minkowski()
			{
				minkowski()
				{
					cube([ phone[0]+case[0]-2*case_rounding-2*case_rounding_sphere, 
						phone[1]+case[1]-2*case_rounding-2*case_rounding_sphere,
						phone[2]+case[2]-2*case_rounding_sphere-case_thickness]);

					cylinder(0.00001,case_rounding);
				}
				sphere(case_rounding_sphere);
			}


		translate([case[0]/2,case[1]/2,phone_height])
			op3_v2(op_camera);

		// bottom hole
		translate([phone[0]-5,phone[1],case_hole_bot_loc[2]+0.5])
		rotate(-90,[0,0,1])
			rotate(-90,[1,0,0])
				hull()
				{
					translate([case_hole_bot_loc[0]+5,0,0])
						cylinder(case_hole_bot[0]+10, d=case_hole_bot[1]+2);
					
					translate([case_hole_bot_loc[1]-5,0,0])
						cylinder(case_hole_bot[0]+10, d=case_hole_bot[1]+2);
				}

	}
}