service-packager
================

A set of scripts to package Erlang service into RPM.

Compatible with [Erlang service layout](https://github.com/EchoTeam/rebar-templates#creating-erlangotp-service-layout).

### service-build-target

Generates a target package from a project code base.
Run the script without arguments for more information.
        
### service-build-upgrade

Generates an upgrade package from a project code base.
Run the script without arguments for more information.

### service-build-src

Generates a source package from a project code base.
Run the script without arguments for more information.

## Installation

    git clone git@github.com:EchoTeam/service-packager.git
    cd service-packager
    make rpm
    sudo yum localinstall echo-service-packager.rpm
