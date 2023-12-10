# Module Loader function
# Checks if provided module is installed
# - NOT? => install + load
# - INSTALLED? => load

# code for checking if installed taken from stack overflow: https://stackoverflow.com/questions/28740320/how-do-i-check-if-a-powershell-module-is-installed

function load-module($module) {
    write-host " "
    
    if (Get-Module -name $module -ListAvailable) { # check if module is installed
        write-host "[ModuleLoader] The module $module is already installed!"
        
    } else { # if not installed install for current user
        write-host "[ModuleLoader] The module $module is not yet installed!"
        write-host "[ModuleLoader] Installing ..."
        write-host " "

        Install-Module $module -scope CurrentUser

        write-host " "
        write-host "[ModuleLoader] The module $module has been installed succesfully"

    }

    write-host "[ModuleLoader] Importing module $module..."
    import-module $module
    write-host "[ModuleLoader] The module $module has been loaded succesfully"

    write-host " "
}