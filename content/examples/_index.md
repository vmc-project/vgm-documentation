+++
title = "Examples"
menuTitle = ""
chapter = false
weight = 5
#pre = "<b>4. </b>"
+++


The VGM examples demonstrate use of VGM for conversion
of existing native geometries.
 
    E01:  Geant4 -> Root
    E02:  Root   -> Geant4
    E03:  Geant4 -> XML 
    E04:  Root   -> XML 
 
The Geant4 basic example `B4a` source is used in E01, E02, E03 and the
ROOT `rootgeom.C` macro is used in E04. The geometry conversion 
in E01, E02, E03 examples is performed in `src/B4DetectorConstruction.cc` class
and in E04 example in `rootgeom.cxx`.
 
See the code within the comment lines

```c++
// VGM demo
```
and

```c++
// end VGM demo
```
in these files.
