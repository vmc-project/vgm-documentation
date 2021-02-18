+++
title = "Options"
menuTitle = "Options"
chapter = false
hidden = false
showhidden = true
weight = 2
+++

### Debug

Debug printing can be switched on via the `VGM::IFactory::SetDebug` function:

```c++
IFactory& myFactory;                                     
myFactory.SetDebug(n);                                   
      // where n=1 or 2; if 2 also object adresses are printed  
```

### Ignore

If geometry imported in VGM includes some solid not supported in VGM (eg. a user defined solid in Geant4), then VGM prints a warning and stops. It is however possible to let VGM continue by setting the option "Ignore" to the factory importing the geometry:

```c++
IFactory& myFactory;                                     
myFactory.SetIgnore(true);                               
```

### BestMatch

This option is used only in the context of a division with gaps in the ROOT geometry. As there is not an equivalent placement in Root, this feature is emulated by default via an intermediate division without gaps and a placement of the cell volumes. This however results in a different volume hierarchy than in the source (Geant4 geometry).

When a new, "bestMatch" option is selected, this feature is implemented via simple placements of the cells in the mother volume, what may be however ineffiecient in case of a large number of divisions.

```c++
IFactory& myFactory;
myFactory.SetBestMatch(true);                            
```
