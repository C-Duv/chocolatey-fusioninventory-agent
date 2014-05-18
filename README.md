chocolatey-fusioninventory-agent
================================

[Chocolatey](http://chocolatey.org) package for [FusionInventory](http://www.fusioninventory.org) Agent.

This will silently install [FusionInventory](http://www.fusioninventory.org) (an auto-inventory tool for [GLPI](http://www.glpi-project.org)) Agent on Windows operating systems via [Chocolatey](http://chocolatey.org) Machine Package Manager.

[GLPI](http://www.glpi-project.org) is a Information Resource-Manager. You can use it to build up a database with an inventory for your IT assets (computers, softwares, printers, switches, ...). Also includes a ticket-based Helpdesk, planned maintenance tasks, network topology report.

[FusionInventory](http://www.fusioninventory.org) deals with populating the GLPI inventory automatically via agents deployed on computers to fetch name, hardward specs, network configuration, installed softwares, ...

Usage examples
--------------

:exclamation: [Chocolatey](http://chocolatey.org) is required to use the fusioninventory-agent Chocolatey package, see [installation instructions](https://github.com/chocolatey/chocolatey/wiki/Installation).

:grey_exclamation: Cloning of this repository is not required to use it: packages are stored on Chocolatey server

* Run Agent installer with defaults settings:
    ```Batchfile
    choco install fusioninventory-agent
    ```

* Run Agent installer with custom settings by providing the installer some command line options (via Chocolatey `-installArgs` option):

    * Set the URL of the GLPI server to use, don't inventory printer, don't create links in the Start Menu and perform the inventory task immediately after installation:
        ```Batchfile
        choco install fusioninventory-agent -installArgs '/server="http://glpi.example.com/plugins/fusioninventory/" /no-category=Printer /no-start-menu /runnow'
        ```

    * PowerShell version that uses machine's domain (Windows AD) to set the HTTP proxy the agent should use:
        ```PowerShell
        choco install fusioninventory-agent -installArgs '/proxy="http://proxy.' + $env:userdnsdomain + '"'
        ```

    The list of available command line options can be found on the FusionInventory documentation (section *[windows-installer-2.3.x-command-line](http://www.fusioninventory.org/documentation/agent/installation/windows/windows-installer-2.3.x-command-line/)*).
