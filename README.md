# 3dprintable_oneplus3_wallet_case_openscad
 A 3d printable customizable wallet case for OnePlus 3/3T designed with OpenSCAD

Customizable types: Wallet Case, Flip Case, Bumper
Customizable text: You can add your own name or signature in customizer, by default its "OnePlus"

Default settings:
Wallet Case with 3 credit card pockets, one extra pocket and an integrated stand.

Images: red case=>Semiflex, transparent=>Taulman PCTPE

We all suffer from bad bed adhision from time to time, why not use it to our advantage?
When adding a small air gap between layers they still adhere during printing but can be seperated to form pockets :-)
I used Simplify3D, not tested with other slicers.

If you have problems separating the layers add a small piece of tape at the air gaps during printing.
Usually its enough to have a 3mm wide opening to insert a screw driver and successively open the pocket.
I used a piece of kapton tape for the stand only, you can see it on the picture (yellow tape).
If you use too much tape the layers may separate during printing which can cause deformation or a failed print.

You should use a flexible material for flip and wallet case styles, as the hinge can break after some time with harder materials.
Optimized for Semiflex/Cheetah, but sucessfully used Taulman PCTPE, too (which is a combination of Nylon and TPE).

Print Settings
Printer:
Kossel XL

Rafts:
No
Supports:
No
Resolution:
0.1
Infill:
30
Notes:
Semiflex/Cheetah
nozzle: 0.4 mm
print width: 0.42 mm
layer height: 0.15 mm
nozzle temp: 240 degrees celsius
bed temp: 50 degrees celsius
speed: 40mm/s
fan on
top/bottom/outline layers: 3/2/2
no raft
infill 30%
outline overlap 10% (use as less as possible)
bridging extrusion multiplier: 100%
bridging speed: 100%

print time: 5:10:00 hours (wallet case)
material used: about 55g


For Taulman PCTPE:
Mostly the same but change following settings:
layerHeight: 0.1
standZLayer: 5
caseSideThickness: 1.9
caseTopBottomThickness: 1.9
phoneDimensionAdditionalX: 0.1
phoneDimensionAdditionalY: 0.1
phoneDimensionAdditionalZ: 0.1

and use these slicer settings:
bed temp: 75 degrees celsius
speed: 75mm/s
fan off
-> print time 2:55:00
-> material used: about 36g