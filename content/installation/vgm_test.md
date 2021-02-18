+++
title = "vgm_test"
menuTitle = ""
chapter = false
hidden = false
showhidden = true
weight = 2
#pre = "<b>2. </b>"
+++
 
For convenience, the VGM test program is defined as a standard Geant4 application example 
though this is not the only way of VGM use. 
(See the [VGM User Guide](/user-guide) about other ways of VGM application.)

The test program includes several geometry setups, each one concentrated on particular 
geometry features:

    Solids           -  builds all VGM supported solids 
    Placements[2]    -  test for placements via translation and rotation
    Reflections      -  test positions with reflection for all solids               
    AssembliesN      -  test volume assemblies
                        N=1 - assemblies in more levels
                        N=2 - assemblies with reflection
    BooleansSolidsM  -  test Boolean solids
                        M=1 - Boolean solids with no displacement
                        M=2 - Boolean solids with displacement including
                        translation and rotation
                        M=3 - Boolean solids with displacement including
                        reflection
    DisplacedSolidsN -  test solids with displacement
                        N=1 - boxes with displacement
                        N=2 - as BooleanSolids2 but with displacement is defined via
                        Displaced solid
    ScaledSolids     -  test all VGM supported solids with scaled trasnformation
                        and the same placements as in Reflections 
    NewSolid         -  builds selected solid individually
    MultiUnion       -  test for multi union solid
    Special          -  loads external geometry from geometry.root file;
                        can be run only with input = Root             

 For each test, the geometry definition is provided in three ways:
 * via VGM interfaces
 * via Geant4
 * via Root

 See classes TstGeometryViaXXX, XXX = VGM, Geant4, Root.
 
The selection of the test configuration is made via arguments passed
into main program:

    Usage: 
    vgm_test inputType inputFactory outputFactory outputXML selectedTest 
             [debug] [openAngle] [noVis] [run] [rootNavig]
             inputType     = VGM, AGDD, Geant4, Root
             inputFactory  = AGDD, Geant4, Root
             outputFactory = Geant4, Root, None
             outputXML     = AGDD, GDML, G4GDML, noXML
             selectedTest  = Solids, NewSolid, Placements[2], Reflections
                             AssembliesN, BooleanSolidsM, ScaledSolids, 
                             MultiUnion, Special, DisplacedSolidN
                                  where N = 1, 2; M = 1, 2, 3
             debug         = if specified the factories operate in debug mode
             ignore        = if specified the factories operate in ignore mode
             bestMatch     = if specified the factories operate in bestMatch mode
             openAngle     = if specified, solids like tubs, cons etc. are built
                             with open azimuthal angle
             noVis         = no visualisation
             run           = run with the generator defined in macro/den_selectedTest.mac
             rootNavig     = use navigation via G4Root
             singleMode    = activate single mode conversion
                             (only convert solids from built geometry one by one)

For example

    vgm_test VGM Geant4 Root noXML Solids
 
Geant4 geometry for Solids test will be built via the VGM factory
and exported in Root.         
 
All test configurations can be run via `test_suite.sh` shell script. See more details about test suites in the [Installation](/installation) section. 
 
Though this test program demonstrates use of VGM in all possible
ways, it was written for the purpose of testing and is not
meant to substitute an example of VGM use.
Examples how to use VGM can be found in the dedicated [Examples](/examples) section.
