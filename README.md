# Control of Weir Flow by Changing Geometry

## Team

|Laxman Desai|Sarthak Bhardwaj|Sagar Yadav|Krutarth Dhaduk|
|:-------:|:-------:|:-------:|:-------:|
|190020066|190040106|19D180026|19D170012|

## Problem statement

We will try and understand how height of fluid over weir affects the flow rate of water across the weir in laminar and turbulent conditions.

## Assumptions

1. Fluid is water at 25 degrees.
2. Surface tension modeling is done by the continuum method <img src="img/svgs_darkmode/20093a7a42aadaaf80e2836ea163836d.svg?invert_in_darkmode" align=middle width=123.8908506pt height=24.65753399999998pt/>
3. For the calculation of Reynold's number, flow is approximated to that over a flat plate. Transition from laminar to turbulent assumed at <img src="img/svgs_darkmode/05db28c3a47bb6b58c641e24396d12be.svg?invert_in_darkmode" align=middle width=93.48160469999999pt height=26.76175259999998pt/>

## Properties

### Dimensions

* Fixed:
  1. <img src="img/svgs_darkmode/2ba0de94c6484487dcbdbe2ae6282785.svg?invert_in_darkmode" align=middle width=199.58927504999997pt height=22.831056599999986pt/>
  2. <img src="img/svgs_darkmode/04a3a6ea08b7d680d6bd81b14c1a680e.svg?invert_in_darkmode" align=middle width=173.15462669999997pt height=22.831056599999986pt/>
  3. <img src="img/svgs_darkmode/1c60807f7a06945474f47a44f104ba29.svg?invert_in_darkmode" align=middle width=267.5611851pt height=22.831056599999986pt/>
* Variables:
  1. <img src="img/svgs_darkmode/378c1a52c8eb61b3d4cd17d279568fda.svg?invert_in_darkmode" align=middle width=147.63902505pt height=22.831056599999986pt/>
  2. <img src="img/svgs_darkmode/b8e5026ff8b833f17b91162007b27505.svg?invert_in_darkmode" align=middle width=191.14752359999997pt height=22.831056599999986pt/>
  3. <img src="img/svgs_darkmode/eada7dcc9bc4dff8b6f93572d1b66b61.svg?invert_in_darkmode" align=middle width=433.01026395pt height=22.831056599999986pt/>

### Flow

* Laminar:
  1. <img src="img/svgs_darkmode/72db06167d7b14e7ef344e851742714a.svg?invert_in_darkmode" align=middle width=120.49077314999998pt height=26.76175259999998pt/>
  2. <img src="img/svgs_darkmode/bff43984da835695afbaf6ebedeab89f.svg?invert_in_darkmode" align=middle width=290.61455775pt height=33.82514520000003pt/>
* Turbulent:
  1. <img src="img/svgs_darkmode/45f8f17fa9dbe35b76b411231093383f.svg?invert_in_darkmode" align=middle width=74.53191405pt height=24.65753399999998pt/>
  2. <img src="img/svgs_darkmode/be6c547af91335de086cfacaeb18fa32.svg?invert_in_darkmode" align=middle width=254.31304634999998pt height=30.648287999999997pt/>

### Mesh

* Divisions per unit length in the mesh = 2.

### Solver

* K-epsilon turbulence model (2 equations) used.
* Volume ratio used is modified high resolution schemes for interface capturing (HRIC).
* Time step size = 0.05 s
* Number of steps = 200
* Reporting interval = 10

## Boundary conditions

1. No slip condition on the stream bed & the surface of weir.
2. Plug flow in the inlet stream.

## Visualization

<figure style="text-align: center">
    <img src="https://i.imgur.com/pRjwIFX.png" width="50%">
    <figcaption>
      <b>Figure 1.1:</b> 3D geometry of flow over weir
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/Nc2BAlC.png">
    <figcaption>
      <b>Figure 1.2:</b> Cross section view
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/6cr53dC.png">
    <figcaption>
      <b>Figure 1.3:</b> Mesh cross section view
    </figcaption>
</figure>

## Geometry

### Case 1: <img src="img/svgs_darkmode/dafc0007d5168c8f86692d5c9e5b50e5.svg?invert_in_darkmode" align=middle width=65.04935249999998pt height=22.465723500000017pt/>

#### Properties

<img src="img/svgs_darkmode/cd4274c62396a3f37ab339fd474ff947.svg?invert_in_darkmode" align=middle width=152.40095144999998pt height=22.465723500000017pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/8Iy9t9a.jpg">
    <figcaption>
      <b>Figure 2.1:</b> 2D mesh for case 1 (H=0)
    </figcaption>
</figure>

#### Mesh - `Gmsh .geo file`

```glsl
// Gmsh project created on Mon May 10 10:15:28 2021
SetFactory("OpenCASCADE");
Point(1) = {0, 0, 0, 1.0};
Point(2) = {15, 0, 0, 1.0};
Point(3) = {15, 3, 0, 1.0};
Point(4) = {16, 3, 0, 1.0};
Point(5) = {16, 0, 0, 1.0};
Point(6) = {25, 0, 0, 1.0};
Point(7) = {25, 6, 0, 1.0};
Point(8) = {0, 6, 0, 1.0};
Point(9) = {0, 3, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 9};
Line(9) = {9, 1};
Curve Loop(1) = {8, 9, 1, 2, 3, 4, 5, 6, 7};
Plane Surface(1) = {1};
Physical Curve("inlet", 10) = {9};
Physical Curve("outlet", 11) = {6, 5};
Physical Curve("ambient", 12) = {7};
Physical Curve("fw", 13) = {8, 1, 2, 3, 4};
Physical Surface("Area1", 14) = {1};
Transfinite Curve {7} = 50 Using Progression 1;
Transfinite Curve {6} = 12 Using Progression 1;
Transfinite Curve {8} = 6 Using Progression 1;
Transfinite Curve {9} = 6 Using Progression 1;
Transfinite Curve {1} = 30 Using Progression 1;
Transfinite Curve {5} = 18 Using Progression 1;
Transfinite Curve {2} = 6 Using Progression 1;
Transfinite Curve {4} = 6 Using Progression 1;
Transfinite Curve {3} = 2 Using Progression 1;
```

### Case 2: <img src="img/svgs_darkmode/7bca7581758f7809e188002fa99a4b62.svg?invert_in_darkmode" align=middle width=77.83478669999998pt height=22.465723500000017pt/>

#### Properties

<img src="img/svgs_darkmode/c0dbeaee6114db34780353a807329d58.svg?invert_in_darkmode" align=middle width=165.18638564999998pt height=22.465723500000017pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/x8nHqPb.jpg">
    <figcaption><b>Figure 2.2:</b> 2D mesh for case 2 (H=0.5)</figcaption>
</figure>

#### Mesh - `Gmsh .geo file`

```glsl
SetFactory("OpenCASCADE");
Point(1) = {0, 0, 0, 1.0};
Point(2) = {15, 0, 0, 1.0};
Point(3) = {15, 2.5, 0, 1.0};
Point(4) = {16, 2.5, 0, 1.0};
Point(5) = {16, 0, 0, 1.0};
Point(6) = {25, 0, 0, 1.0};
Point(7) = {25, 6, 0, 1.0};
Point(8) = {0, 6, 0, 1.0};
Point(9) = {0, 3, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 9};
Line(9) = {9, 1};
Curve Loop(1) = {9, 1, 2, 3, 4, 5, 6, 7, 8};
Plane Surface(1) = {1};
Physical Curve("inlet", 10) = {9};
Physical Curve("outlet", 11) = {6, 5};
Physical Curve("ambient", 12) = {7};
Physical Curve("fw", 13) = {8, 1, 2, 3, 4};
Physical Surface("Area2", 14) = {1};
SetFactory("OpenCASCADE");
Transfinite Curve {7} = 50 Using Progression 1;
Transfinite Curve {6} = 12 Using Progression 1;
Transfinite Curve {8} = 6 Using Progression 1;
Transfinite Curve {9} = 6 Using Progression 1;
Transfinite Curve {1} = 30 Using Progression 1;
Transfinite Curve {5} = 18 Using Progression 1;
Transfinite Curve {2} = 5 Using Progression 1;
Transfinite Curve {4} = 5 Using Progression 1;
Transfinite Curve {3} = 2 Using Progression 1;
```

### Case 3: <img src="img/svgs_darkmode/f553b7c2a0a0dac091b43b7a06db6ff9.svg?invert_in_darkmode" align=middle width=65.04935249999998pt height=22.465723500000017pt/>

#### Properties

<img src="img/svgs_darkmode/360bbc8f5749bbd5013862725b364177.svg?invert_in_darkmode" align=middle width=152.40095144999998pt height=22.465723500000017pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/WNk7ODQ.jpg">
    <figcaption>
      <b>Figure 2.3:</b> 2D mesh for case 3 (H=1)
    </figcaption>
</figure>

#### Mesh - `Gmsh .geo file`

```glsl
SetFactory("OpenCASCADE");
Point(1) = {0, 0, 0, 1.0};
Point(2) = {15, 0, 0, 1.0};
Point(3) = {15, 2, 0, 1.0};
Point(4) = {16, 2, 0, 1.0};
Point(5) = {16, 0, 0, 1.0};
Point(6) = {25, 0, 0, 1.0};
Point(7) = {25, 6, 0, 1.0};
Point(8) = {0, 6, 0, 1.0};
Point(9) = {0, 3, 0, 1.0};
Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 5};
Line(5) = {5, 6};
Line(6) = {6, 7};
Line(7) = {7, 8};
Line(8) = {8, 9};
Line(9) = {9, 1};
Curve Loop(1) = {8, 9, 1, 2, 3, 4, 5, 6, 7};
Plane Surface(1) = {1};
Physical Curve("inlet", 10) = {9};
Physical Curve("outlet", 11) = {6, 5};
Physical Curve("ambient", 12) = {7};
Physical Curve("fw", 13) = {8, 1, 2, 3, 4};
Physical Surface("Area3", 14) = {1};
Transfinite Curve {7} = 50 Using Progression 1;
Transfinite Curve {6} = 12 Using Progression 1;
Transfinite Curve {8} = 6 Using Progression 1;
Transfinite Curve {9} = 6 Using Progression 1;
Transfinite Curve {1} = 30 Using Progression 1;
Transfinite Curve {5} = 18 Using Progression 1;
Transfinite Curve {2} = 4 Using Progression 1;
Transfinite Curve {4} = 4 Using Progression 1;
Transfinite Curve {3} = 2 Using Progression 1;
```

## Results (general)

<figure style="text-align: center">
    <img src="https://i.imgur.com/6oDESgB.png">
    <figcaption>
      <b>Figure 3.1:</b> Position vs outlet velocity
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/9hQr1QO.png">
    <figcaption>
      <b>Figure 3.2:</b> Position vs outlet static pressure
    </figcaption>
</figure>


<figure style="text-align: center">
    <img src="https://i.imgur.com/EVKJsvw.png">
    <figcaption>
      <b>Figure 3.3:</b> Residuals vs iterations for laminar flow
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/o8syb4u.png">
    <figcaption>
      <b>Figure 3.4:</b> Residuals vs iterations for
      turbulent flow
    </figcaption>
</figure>

## Results (case specific)

* Case specific versions of the general plots are not shown explicitly, but they follow similar trends.

### Case 1: <img src="img/svgs_darkmode/dafc0007d5168c8f86692d5c9e5b50e5.svg?invert_in_darkmode" align=middle width=65.04935249999998pt height=22.465723500000017pt/>

#### Laminar flow <img src="img/svgs_darkmode/b033d432ee8d500386a641f5db028a90.svg?invert_in_darkmode" align=middle width=128.24596619999997pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/TfVnBSm.png">
    <figcaption>
      <b>Figure 4.1 A:</b> Velocity profile diagram under laminar conditions with height of stream over weir = 0m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/TrzWFZM.png">
    <figcaption>
      <b>Figure 4.1 B:</b> Pressure field diagram under laminar conditions with height of stream over weir = 0m
    </figcaption>
</figure>

#### Turbulent flow <img src="img/svgs_darkmode/e83cfefd01770ee4ba6a1774c1d8574d.svg?invert_in_darkmode" align=middle width=87.31734825pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/IwHVfdK.png">
    <figcaption>
      <b>Figure 4.2 A:</b> Velocity profile diagram under turbulent conditions with height of stream over weir = 0m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/rgntgsR.png">
    <figcaption>
      <b>Figure 4.2 B:</b> Pressure field diagram under turbulent conditions with height of stream over weir = 0m
    </figcaption>
</figure>

### Case 2: <img src="img/svgs_darkmode/7bca7581758f7809e188002fa99a4b62.svg?invert_in_darkmode" align=middle width=77.83478669999998pt height=22.465723500000017pt/>

#### Laminar flow <img src="img/svgs_darkmode/cabfc5b1d2b0574c86b3d75a12a59857.svg?invert_in_darkmode" align=middle width=116.54120114999998pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/RPezIb6.png">
    <figcaption>
      <b>Figure 5.1 A:</b> Velocity profile diagram under laminar conditions with height of stream over weir = 0.5m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/OwP5FLW.png">
    <figcaption>
      <b>Figure 5.1 B:</b> Pressure field diagram under laminar conditions with height of stream over weir = 0.5m
    </figcaption>
</figure>

#### Turbulent flow <img src="img/svgs_darkmode/e83cfefd01770ee4ba6a1774c1d8574d.svg?invert_in_darkmode" align=middle width=87.31734825pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/DDlopKq.png">
    <figcaption>
      <b>Figure 5.2 A:</b> Velocity profile diagram under turbulent conditions with height of stream over weir = 0.5m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/k6HkEo7.png">
    <figcaption>
      <b>Figure 5.2 B:</b> Pressure field diagram under turbulent conditions with height of stream over weir = 0.5m
    </figcaption>
</figure>

### Case 3: <img src="img/svgs_darkmode/f553b7c2a0a0dac091b43b7a06db6ff9.svg?invert_in_darkmode" align=middle width=65.04935249999998pt height=22.465723500000017pt/>

#### Laminar flow <img src="img/svgs_darkmode/cabfc5b1d2b0574c86b3d75a12a59857.svg?invert_in_darkmode" align=middle width=116.54120114999998pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/ZiofUM4.png">
    <figcaption>
      <b>Figure 6.1 A:</b> Velocity profile diagram under laminar conditions with height of stream over weir = 1m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/yKVkgDz.png">
    <figcaption>
      <b>Figure 6.1 B:</b> Pressure field diagram under laminar conditions with height of stream over weir = 0.5m
    </figcaption>
</figure>

#### Turbulent flow <img src="img/svgs_darkmode/e83cfefd01770ee4ba6a1774c1d8574d.svg?invert_in_darkmode" align=middle width=87.31734825pt height=24.65753399999998pt/>

<figure style="text-align: center">
    <img src="https://i.imgur.com/Sk4lOdu.png">
    <figcaption>
      <b>Figure 6.2 A:</b> Velocity profile diagram under turbulent conditions with height of stream over weir = 1m
    </figcaption>
</figure>

<figure style="text-align: center">
    <img src="https://i.imgur.com/UcJ6Rvk.png">
    <figcaption>
      <b>Figure 6.2 B:</b> Pressure field diagram under turbulent conditions with height of stream over weir = 1m
    </figcaption>
</figure>

## Conclusion

Weirs are mainly used to control the flow rates of rivers during periods of high discharge. Sluice gates (or in some cases the height of the weir crest) can be altered to increase or decrease the volume of water flowing downstream.
For constant fluid flow rate, as the height of the weir decreases, distance covered by the fluid over the flat surface also decreases. On an average we observe that the fluid reaches 5 to 6m ahead of weir in case of turbulent flow (minimum in case where H=0) where as less than 1m in case of laminar flows.
Thus, for the optimum outflow conditions for turbulent flow is that  the height of weir should be as close to the height of stream for minimum ahead reach of fluid and controlled outflow of fluid.

<style>
  table {
      width:100%;
  }
  h1 {
    text-align: center;
  }
  figure {
    text-align: center;
  }
</style>
