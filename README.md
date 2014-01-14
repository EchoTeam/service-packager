service-packager
================

A set of scripts to package Erlang service.

Compatible with [Erlang service framework](https://github.com/EchoTeam/rebar-templates#creating-erlangotp-service-layout).

## service-build-target

    Generates a target package from a project code base.
    Should be run in the root directory of the project code base.
    The project must provide the following command:

        make target
        Builds an Erlang target system.
        service-build-target assumes that the target files
        are placed in rel/<project-name>/ directory.

    service-build-target can read rel/<project-name>/build.config if provided.
    build.config is just a set of shell variables.
    Currently supported variables:

        FPM_EXT_OPTS - extra options for fpm
            Default: ""
            Example: "-d perl"

        SERVICE_OWNER - a user under which the service will be running
            Default: <project-name>

        SERVICE_LOG_DIR - path to log directory
            Default: /var/log/<project-name>

        SERVICE_CONFIG_DIR - path to config directory
            Default: /etc/<project-name>

        SERVICE_PREFIX - a path prefix of a service files location
            Default: /usr/local/lib

        VENDOR - vendor field for the rpm package
            Default: ""

        LICENSE - license field for the rpm package
            Default: ""

    Usage:
        service-build-target <project-name>
        
## service-build-upgrade

    Generates an upgrade package from a project code base.
    Should be run in the root directory of the project code base.
    The project must provide the following commands:

        make target
        Builds an Erlang target system.
        service-build-upgrade assumes that the target files
        are placed in rel/<project-name>/ directory.

        make generate-upgrade previous_release=<path-to-prev-release>
        Builds an upgrade Erlang package against what is
        in <path-to-prev-release> directory.
        <path-to-prev-release> must be relative to "rel/" directory.
        service-build-upgrade assumes that the upgrade files
        are placed into rel/*.tar.gz archive.

    service-build-upgrade can read rel/<project-name>/build.config if provided.
    build.config is just a set of shell variables.
    Currently supported variables:

        FPM_EXT_OPTS - extra options for fpm
            Default: ""
            Example: "-d perl"

        SERVICE_OWNER - a user under which the service will be running
            Default: <project-name>

        SERVICE_PREFIX - a path prefix of a service files location
            Default: /usr/local/lib

        VENDOR - vendor field for the rpm package
            Default: ""

        LICENSE - license field for the rpm package
            Default: ""

    Usage:
        service-build-upgrade <project-name> <target-rpm>

        <target-rpm>    A target package against which to generate the upgrade.


## service-build-src

    Generates a source package from a project code base.
    Should be run in the root directory of the project code base.
    The project must provide the following commands:

        make target
        Builds an Erlang target system.
        service-build-src assumes that the target files
        are placed in rel/<project-name>/ directory.

        make clean
            Clean the project code base from binaries.

    service-build-src can read rel/<project-name>/build.config if provided.
    build.config is just a set of shell variables.
    Currently supported variables:

        SERVICE_OWNER - a user under which the service will be running
            Default: <project-name>

        SERVICE_PREFIX - a path prefix of a service files location
            Default: /usr/local/lib

        VENDOR - vendor field for the rpm package
            Default: ""

        LICENSE - license field for the rpm package
            Default: ""

    Usage:
        service-build-src <project-name>

