+++
title = "Geometry Construction"
menuTitle = "Geometry Construction"
chapter = false
hidden = false
showhidden = true
weight = 2
+++

The VGM interfaces can be used to define geometry independently from a concrete geometry model.
For example, the code below builds a world box volume:

```c++
 #include "VGM/volumes/IFactory.h"
 #include "ClhepVGM/transform.h"
 using namespace VGM;

 MyDetectorConstruction::Construct(VGM::IFactory* factory)
 {                                                    
   double wSize = 10*m;
   GISolid* worldS
     = factory->CreateBox("worldS", wSize, wSize, wSize); 
                // create the world solid                 		

   GIVolume* worldV
     = factory->CreateVolume("worldV", worldS, "Air");    
                // create the world volume                

   factory->CreatePlacement("world", 0, worldV, 0, ClhepVGM::Identity());
                // place the world volume                 
 }
```   
 
Choosing the concrete factory (Geant4 or Root VGM factory) will then build the geometry of the chosen model ( Geant4 or Root):
                                                    
```c++
 #include "Geant4GM/volumes/Factory.h"
 MyDetectorConstruction myDetectorConstruction;
 Geant4GM::Factory theFactory;
 myDetectorConstruction->Construct(&theFactory);          
         // Geant4 geometry will be built                 	
 
 #include "RootGM/volumes/Factory.h"
 MyDetectorConstruction myDetectorConstruction;
 RootGM::Factory theFactory;
 myDetectorConstruction->Construct(&theFactory);          
         // Root geometry will be built                   
 ```

