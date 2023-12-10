# TITLE => Global Information Table
# OPTIONID ==> 1

. (Join-Path $PSScriptRoot ./MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

function display-global_info_table($response) {
    clear-host
    write-host ""
    display-subtitle("Global Information Table")
    write-host ""
    write-host "This is a table that lists every asteroid mentioned in this API and displays standard information"
    write-host ""

    $response.near_earth_objects | Select-Object -Property id, designation, name_limited, absolute_magnitude_h, is_potentially_hazardous_asteroid, is_sentry_object | format-table
}