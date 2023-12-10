. (Join-Path $PSScriptRoot ./../MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./../MarkUP/Lists.ps1) # load MarkUP Lists from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./../MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

function display-menu-main() {
    write-host " "
    display-title("Near Space Object API")
    write-host "Please select an action you would like to perform: (Number between 1 and 5)"
    display-list("Global Information Table", "Specific Info List", "Specific Info Graph", "Magnitude Grapher")
    display-line(50)

    $choice = read-host " "
    
    return $choice
}

