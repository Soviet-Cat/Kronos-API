# Kronos-API
API for [**Kronos-Engine**](https://github.com/Soviet-Cat/Kronos-Engine). <br/> 

## Requirements
Kronos-API <ins>***only***</ins> supports Windows **10** or newer. <br/>
This project is <ins>***only***</ins> tested on the below system:
* **Windows** 11
* **i7**-10700KF
* **NVIDIA GeForce RTX** 3070

Support for other platforms, architectures or configurations is <ins>***not***</ins> guaranteed. <br/>
Any inconsistencies, errors or issues encountered outside of the tested environment are <ins>***not***</ins> the responsibility of the developers.

## Build Instructions
Kronos-API is to be built using <ins>[**CMake**](https://cmake.org/)</ins>.

To ***configure***, run:
~~~
cmake -S . -B build
~~~

To ***build***, run:
~~~
cmake --build build
~~~

To ***install***, run:
~~~
cmake --install build --prefix install
~~~

Configuration, build, install and package scripts are supplied for user simplicity. <br/>
For help on usage of any of these scripts, run:
~~~
[script_name] help
~~~ 

To ***configure***, run:
~~~
configure [build_type]
~~~

To ***build***, run:
~~~
build
~~~

To ***install***, run:
~~~
install
~~~

To ***package into a zip***, run:
~~~
package [version] [build_type] [system_name] [system_processor]
~~~

To ***configure, build, install and package into a zip***, run:
~~~
Kronos-API [build_type]
~~~