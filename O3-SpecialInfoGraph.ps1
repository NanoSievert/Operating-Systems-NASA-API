# TITLE => Special Info Graph
# OPTIONID ==> 3

. (Join-Path $PSScriptRoot ./MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

function display-special_info_graph($response) {
    clear-host
    write-host ""
    display-subtitle("Special Information Graphs")
    write-host ""
    write-host "This is a tool to make a graph of the list of parts of the specific information about an asteroid based on their ID."
    write-host "Enter a number in range [0,19]:."
    write-host ""

    $option = read-host " $ "

    $option = [int]$option

    while(-not (($option -ge 0) -and ($option -lt 20))) {
        write-host "ERROR: Option not found, please try again!" -ForegroundColor Red
        $option = read-host " $ "
    }

    $response = $response
    
    graph-miss_distance $response $option
}

function graph-miss_distance($response, $id) {
    # gather values for datapoints

    $datapoints = $response.near_earth_objects[$id].close_approach_data | ForEach-Object { $_.miss_distance.kilometers } 

    $name = $response.near_earth_objects[$id].name

    display-lowsubtitle $name
    write-host ""

    # display average, min, max
    display-line(50)
    write-host "Display basic information"
    $data = $datapoints | Measure-Object -average -min -max
    $data

    $max = $data.Maximum

    $stepsize = $max / 20

    $stepsize = [math]::floor($stepsize)

    $stepsize_format = "Stepsize (y-axis): "+$stepsize

    display-lowsubtitle $stepsize_format

    write-host ""

    # delay to prevent table interferance
    Start-Sleep 2
    # display graph
    Show-Graph -Datapoints $datapoints -GraphTitle "Miss distance (km)" -yAxisStep $stepsize -XAxisStep 15
}