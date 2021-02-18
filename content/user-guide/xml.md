+++
title = "XML"
menuTitle = "XML"
chapter = false
hidden = false
showhidden = true
weight = 2
+++

The VGM geometry can be exported to XML in the AGDD or GDML format. The complying with the XML schema is embedded in the VGM XML exporter code itself, no external XML parser is then needed.

```c++
 #include "XmlVGM/AGDDExporter.h"
 XmlVGM::AGDDExporter xmlExporter1(&theFactory);
 xmlExporter1.GenerateXMLGeometry();                      
      // Export geometry to AGDD                           
                                                        
 #include "XmlVGM/GDMLExporter.h"
 XmlVGM::GDMLExporter xmlExporter2(&theFactory);
 xmlExporter2.GenerateXMLGeometry();                       
      // Export geometry to GDML                          
```

The export from native geometries (Geant4, Root) to XML is demonstrated in examples E03 and E04. The exported XML files (both AGDD and GDML) can be then viewed with the [GraXML tool](http://hrivnac.home.cern.ch/hrivnac/Activities/Packages/GraXML/).
