# TITLE => Magnitude Grapher
# OPTIONID ==> 4

. (Join-Path $PSScriptRoot ./MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

function display-magnitudegraph($response) {
    clear-host
    write-host ""
    display-subtitle("Magnitude Grapher") #display subtitle
    write-host ""
    write-host "This part graphs out the magnitudes of the objects. The magnitude is something that relates to the diameter of the object." # explain yourself
    write-host ""
    display-lowsubtitle("Formula: M = m + 5(log(p) + 1)") # display distance formula in subtitle
    write-host ("p = distance diamater in parsec")
    write-host ""

    $datapoints = $response.near_earth_objects | Select-Object -Property absolute_magnitude_h | ForEach-Object { $_.absolute_magnitude_h } # select datapoints, use foreach object to convert the json string into an integer value

    # delay to prevent table interferance
    Start-Sleep 2
    # display graph
    Show-Graph -Datapoints $datapoints -GraphTitle "Magnitude" -yAxisStep 1 -Type Scatter

}