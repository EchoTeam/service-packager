service-packager
================

A set of scripts to package Erlang service into RPM.
RPMs are built with [fpm](https://github.com/jordansissel/fpm).

Compatible with [Erlang service layout](https://github.com/EchoTeam/rebar-templates#creating-erlangotp-service-layout).

## Build scripts

 * `service-build-target` - generates a target package from a project code base.
 * `service-build-upgrade` - generates an upgrade package from a project code base.
 * `service-build-src` - generates a source package from a project code base.

Run the scripts without arguments for more information.

## Installation

    gem install fpm
    git clone git@github.com:EchoTeam/service-packager.git
    cd service-packager
    make rpm
    yum localinstall echo-service-packager.rpm
