+++
title = "Geometry Conversions"
menuTitle = "Geometry Conversions"
chapter = false
hidden = false
showhidden = true
weight = 1
+++

### Volume hierarchy

To convert native geometry from one geometry model to another one, the geometry has to be first imported in VGM (the native geometry objects will be mapped to the VGM interfaces) using the concrete VGM factory for this geometry model, and then exported using the VGM factory for the other geometry model.

To convert Geant4 geometry in ROOT:

```c++                                              
 #include "Geant4GM/volumes/Factory.h" 
 #include "RootGM/volumes/Factory.h" 
 #include "TGeoManager.h"                               
                                                        
 // Import Geant4 geometry to VGM                       
 Geant4GM::Factory g4Factory;
 g4Factory.Import(physiWorld);                          
      // where physiWorld is of G4VPhysicalVolume* type 

 // Export VGM geometry to Root                         
 RootGM::Factory rtFactory;
 g4Factory.Export(&rtFactory);
 gGeoManager->CloseGeometry();
 return rtFactory.World();                              
      // returns Root top node, of TGeoNode* type       
 ```

The geometry conversions between Geant4 and ROOT geometry models are demonstrated in the provided examples E01 and E02.

### Single Solid

Since version 4.4, it is also to use VGM to convert a single solid from one geometry model into another one:

```c++                                                  
  XFactory xFactory;
  YFactory yFactory;
  xFactory.Import(xsolid);
  xFactory.Export(yFactory);
  YSolid* ysolid = yFactory.Solid();                    
```
