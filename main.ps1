# =======================================================================================
#     _____                _____ _             _                  _____ _____ _     
#    / ____|              / ____| |           | |           /\   |  __ \_   _( )    
#   | |     __ _ ___  ___| (___ | |_ _   _  __| |_   _     /  \  | |__) || | |/ ___ 
#   | |    / _` / __|/ _ \\___ \| __| | | |/ _` | | | |   / /\ \ |  ___/ | |   / __|
#   | |___| (_| \__ \  __/____) | |_| |_| | (_| | |_| |  / ____ \| |    _| |_  \__ \
#    \_____\__,_|___/\___|_____/ \__|\__,_|\__,_|\__, | /_/    \_\_|   |_____| |___/
#                                                 __/ |                             
#                                                |___/                              
# =======================================================================================
# init
clear-host

# File imports
# =- Modules
. (Join-Path $PSScriptRoot ./modules/graphical.ps1) # load graphical from current script path (instead of users path)

# =- MarkUP
. (Join-Path $PSScriptRoot ./MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Lists.ps1) # load MarkUP Lists from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

# =- Menu's
. (Join-Path $PSScriptRoot ./Menu/main-menu.ps1) # load main Menu from current script path (instead of users path)

# =- API's
. (Join-Path $PSScriptRoot ./API/NasaAPILoader.ps1) # load NASA API from current script path (instead of users path)

# =- options
. (Join-Path $PSScriptRoot ./O1-GlobalInfoTable.ps1) # load Global Info Table (Option 1) from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./O2-SpecialInfo.ps1) # load Specific Info (Option 2) from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./O3-SpecialInfoGraph.ps1) # load Specific Info (Option 3) from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./O4-magnitudeGrapher.ps1) # load magnitude graph (Option 4) from current script path (instead of users path)

# Module loaders
load-Graphical # load graphical module

# Initialise API Response and binds it to variable $ response
$response = load-NasaAPI("h5kJ8QPlbYTYJ15KToNWAmfIKn5T95ElqwcnrR7s") # Generate response from API

Start-Sleep 1 # debug code

# Main
clear-host
$option = display-menu-main # get option from user through menu

while(-not (($option -gt 0) -and ($option -lt 6))) { # get option from user through menu if they answered wrong
    clear-host
    write-host "ERROR: Option not found, please try again!" -ForegroundColor Red # display error message
    $option = display-menu-main
}

if ($option -eq 1) {
    display-global_info_table($response)

} elseif ($option -eq 2) {
    display-special_info($response)

} elseif ($option -eq 3) {
    display-special_info_graph($response)

} elseif ($option -eq 4) {
    display-magnitudegraph($response)

} elseif ($option -eq 5) {

}


