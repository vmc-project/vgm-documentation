+++
title = "Installation"
menuTitle = ""
chapter = false
hidden = false
showhidden = true
weight = 2
#pre = "<b>2. </b>"
+++
 
### Configuration

The CMake build system will build and install VGM like a typical CMake'ed 
package. 

First we will assume that the VGM source has been downloaded in a directory 
`/my_path`, so that the VGM directory packages sits in a subdirectory 

     /my_path/vgm/packages
 
We refer to `/my_path/vgm` directory as the source directory. The next step is to 
create a directory in which to configure and run the build and store the 
build products. This directory should not be the same as, or inside, 
the source directory. In this guide, we create this build directory 
alongside our source directory:

     cd /my_path
     mkdir vgm_build
     ls
     vgm vgm_build

To configure the build, change into the build directory and run CMake:

     cd /my_path/vgm_build
     cmake -DCMAKE_INSTALL_PREFIX=/my_path/vgm_install /my_path/vgm
  
Here, the CMake Variable `CMAKE_INSTALL_PREFIX` is used to set the install 
directory, the directory under which the VGM libraries and headers will be 
installed. It must be an absolute path. The second argument to CMake is the 
path to the source directory. In this example, we have used the absolute path
to the source directory, but you can also use the relative path from your 
build directory to your source directory. 

#### Configuration Options
 
Additional arguments may be passed to CMake to (in)activate optional 
components of VGM, or tune the build and install parameters. See 
`vgm/CMakeList.txt` for details of these  options. If you run CMake and decide
afterwards you want to activate additional options, simply rerun CMake 
passing it those options.

On executing this CMake command, it will run, configuring the build and 
generating  Unix Makefiles to perform the actual build. 
   
Overview of available options and their default values:

     WITH_GEANT4       "Build Geant4 dependent subpackage (Geant4GM)" ON
     WITH_ROOT         "Build Root dependent subpackage(RootGM)"      ON
     WITH_EXAMPLES     "Build examples"                               ON
     WITH_TEST         "Build test"                                   OFF
     WITH_G4ROOT       "Build test with G4Root"                       OFF
     INSTALL_EXAMPLES  "Install examples"                             ON
 
### Compilation

After the configuration has run, to run the build, simply execute `make` in 
the build directory:

     make -jN

where N is the number of parallel jobs you require (e.g. if your machine has
a dual core processor, you could set N to 2).

The build will now run, and will output information on the progress of the 
build and current operations. If you need more output to help resolve issues
or simply for information, run `make` as

     make -jN VERBOSE=1
  
### Installation

Once the build has completed, you can install VGM to the directory you 
specified earlier in `CMAKE_INSTALL_PREFIX` by running

     make install
  
in the build directory. The libraries and headers are installed under your
chosen install prefix in a standard Unix-style hierarchy of directories

### Test

When the `WITH_TEST` cmake option is activated, the `vgm_test` program is automatically 
built in the build directory, in `/my_path/vgm_build/test` and installed in 
`/my_path/vgm_install/bin`.
 
It can be run for example in this way:

    vgm_test VGM Geant4 Root noXML Solids

See [vgm_test](vgm_test) for all available options.

All test configurations can be run via the `test_suite.sh` script:

    ./test_suite.sh

which internally runs three test suites:

    ./test1_suite.sh
    ./test2_suite.sh
    ./test3_suite.sh

The test output, stored in the `log` directory, can be then compared
with the reference output in the `log_ref` directory.

Optionally, the test can be built with the **G4Root** package, see:
https://vmc-project.github.io/user-guide/g4root/
when the `WITH_G4ROOT` cmake option is activated.
   
Note that even though also Geant4 VMC can be build with VGM, there is no
circular dependence between these packages, as G4Root is lower level package
which does not depend on the Geant4 VMC library.

To build both VGM with G4Root and Geant4 VMC with VGM, you can proceed
in this way:
   1. install VGM without test
   2. install Geant4 VMC with VGM
   3. build and install VGM test against G4Root installed with Geant4 VMC
   
If you are not interested in using Geant4 VMC then you can proceed 
in this way:
   1. Download Geant4 VMC and install only G4Root
   2. Install VGM with test against G4Root installed
 
{{% notice note %}}
**Aknowledgement**\
The CMake build for Virtual Geometry Model is a result of a merge 
of the CMake configuration files kindly provided 
by Florian Uhlig, GSI and Pere Mato, CERN.
{{% /notice %}}

* [vgm_test](vgm_test)
