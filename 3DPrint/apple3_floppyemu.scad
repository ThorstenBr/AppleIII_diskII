// Copyright 2022 Thorsten Brehm
// CC-BY-SA 4.0

// Which part do you want to see?
part = "bottom"; // [all:All,both:Both,bottom:Bottom,top:Top,prototype:Prototype,test:Test,lid:Lid]

// Show PCB?
show_pcb = "no"; // [no:No,yes:Yes]

/* [Internals] */

// Radius of the corners
Box_Corner_Radius = 3.0; // [0: 10]

// Box skin width
SKIN = 1.0; // [1: 0.1: 5]

/* [Hidden] */

// PCB width
PcbX_Width = 43.5;
// PCB height
PcbY_Height = 2.5;
// PCB depth
PcbZ_Depth = 35.5;

// Width (X) of the box
BoxX_Width = PcbX_Width+6; // [10: 100]

// Height (Y) of the box
BoxY_Height = 8-1; // [5: 100]

// Depth (Z) of the box
BoxZ_Depth = PcbZ_Depth+6; // [10: 200]

LedgeHeight = 3;
LedgeSkin   = 1;
LedgeOverlap = 1.5;

ConnectorDepth = 9.5;
ConnectorWidth1 = 34;
ConnectorWidth2 = 41.5;

// Quality
quality = "high"; // [low:Low,high:High]

include <baseLib.scad>

module logo(x,y,z)
{
 Font = "Liberation Sans";
 FontSize = 3;
 translate([x,y,z])
 {
   translate([0,0,2])
     rotate([90,0,180]) linear_extrude(height = 0.4) text("T.Brehm", font = Font, size = FontSize, halign="center", valign="center");
   translate([0,0,-2])
     rotate([90,0,180]) linear_extrude(height = 0.4) text("10/2022", font = Font, size = FontSize-1, halign="center", valign="center");
 }
}

module marker(x,y,z, h)
{
 Font = "Liberation Sans";
 FontSize = 2;
 translate([x,y,z])
 rotate([90,180,180])
 {
   linear_extrude(height = h) { text("▲", font = Font, size = FontSize); }
 }
}



module pcb()
{
	translate([(BoxX_Width-PcbX_Width)/2,1,(BoxZ_Depth-PcbZ_Depth)/2])
	{
		cube([PcbX_Width, PcbY_Height, PcbZ_Depth]);
		
		translate([0,PcbY_Height,4])
		{
			translate([1.9-0.3,0,0]) cube([ConnectorWidth1, BoxY_Height*2, ConnectorDepth]);
			translate([1.5,0,20-0.7]) cube([ConnectorWidth2, BoxY_Height*2, ConnectorDepth]);
		}
	}
	
}

module boxOpenings()
{
	// circuit board
	pcb();
	marker(5+3,BoxY_Height+1-0.4,BoxZ_Depth-3.4,0.4);
	marker(5+3,BoxY_Height+1-0.4,20-1,0.4);
}

module box(SkinWidth, XWidth, YHeight, ZDepth, CornerRadius)
{
	// main shell
	difference() {
		translate([-SkinWidth, -SkinWidth, -SkinWidth]) //roundedCube(0, XWidth+SkinWidth*2, YHeight+SkinWidth*2, ZDepth+SkinWidth*2, CornerRadius);
			rcube(size=[XWidth+SkinWidth*2, YHeight+SkinWidth*2, ZDepth+SkinWidth*2], radius=[2, 2, 2], center=false);
		if (SkinWidth>0)
			//roundedCube(0, XWidth, YHeight, ZDepth, CornerRadius);
			rcube(size=[XWidth, YHeight, ZDepth], radius=[2, 2, 2], center=false);
	}
}

module makeThing()
{
	XOfs = 2;
	translate([0,-2,0])
	difference()
	{
		union()
		{
			box(SKIN, BoxX_Width, BoxY_Height, BoxZ_Depth, Box_Corner_Radius);
			translate([XOfs,0,1]) cube([2,BoxY_Height,4]);
			translate([BoxX_Width-XOfs-2,0,1]) cube([2,BoxY_Height,4]);
			
			translate([XOfs,0,BoxZ_Depth-4-1]) cube([2,BoxY_Height,4]);
			translate([BoxX_Width-XOfs-2,0,BoxZ_Depth-4-1]) cube([2,BoxY_Height,4]);
		}
		boxOpenings();
	}
}

module makeLedge()
{
	translate([0, -LedgeOverlap, 0])
	difference()
	{
		cube([BoxX_Width, LedgeHeight+LedgeOverlap, BoxZ_Depth]);
		translate([LedgeSkin, 0, LedgeSkin]) cube([BoxX_Width-LedgeSkin*2, LedgeHeight+LedgeOverlap, BoxZ_Depth-LedgeSkin*2]);
	}
}

module lock(diameter, length)
{
	$fn=24;
	cylinder(r=diameter/2, length);
}

module locks(diameter, length)
{
	LockR = 1.5;
	translate([BoxX_Width/6,1.2,0]) lock(diameter, length);
	translate([BoxX_Width*5/6,1.2,0]) lock(diameter, length);
	translate([BoxX_Width/6,1.2,BoxZ_Depth-length]) lock(diameter, length);
	translate([BoxX_Width*5/6,1.2,BoxZ_Depth-length]) lock(diameter, length);
}

module makeTop()
{
	intersection()
	{
		makeThing();
		translate([-SKIN*2, 0, -SKIN*2]) cube([BoxX_Width+SKIN*4, BoxY_Height+SKIN*2, BoxZ_Depth+SKIN*4]);
	}
	locks(1.5, 0.5);
}

module makeBottom()
{
	difference()
	{
		union()
		{
			intersection()
			{
				makeThing();
				translate([-SKIN*2, -(BoxY_Height+SKIN*2), -SKIN*2]) cube([BoxX_Width+SKIN*4, BoxY_Height+SKIN*2, BoxZ_Depth+SKIN*4]);
			}
			makeLedge();
			logo(BoxX_Width/2,-2,BoxZ_Depth/2);
		}
		makeTop();
		locks(1.7, 1);
	}
}

module main() {
    if (part == "test")
    {
        boxOpenings();
    }
    else
    if (part == "top") {
        makeTop();
    }
    else
    if (part == "bottom") {
        makeBottom();
        if (show_pcb == "yes")
	        translate([0,-2,0]) pcb();
    }
    else
    if (part == "all") {
        makeTop();
	translate([0,-20,0]) makeBottom();
    } else
    if (part == "both") {
        makeTop();
	translate([0,3,-5]) rotate([180,0,0]) makeBottom();
    } else {
        // all
        makeThing();
    }
}

main();
