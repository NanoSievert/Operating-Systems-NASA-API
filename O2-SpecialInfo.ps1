# TITLE => Special Info List
# OPTIONID ==> 2

. (Join-Path $PSScriptRoot ./MarkUP/Headers.ps1) # load MarkUP Headers from current script path (instead of users path)
. (Join-Path $PSScriptRoot ./MarkUP/Line.ps1) # load MarkUP Lines from current script path (instead of users path)

function display-special_info($response) {
    clear-host
    write-host ""
    display-subtitle("Special Information List")
    write-host ""
    write-host "This is a table that lists specific information about an asteroid based on their ID."
    write-host "Enter a number in range [0,19]:."
    write-host ""

    $option = read-host " $ "

    $option = [int]$option

    while(-not (($option -ge 0) -and ($option -lt 20))) {
        write-host "ERROR: Option not found, please try again!" -ForegroundColor Red
        $option = read-host " $ "
    }

    clear-host
    display-line(25)
    display-lowsubtitle("General info")
    $response.near_earth_objects[$option] | Select-Object -Property id, name, absolute_magnitude_h, is_potentially_hazardous_asteroid, is_sentry_object | format-list

    display-line(25)
    display-lowsubtitle("Estimated Diameter (km)")
    $response.near_earth_objects[$option].estimated_diameter.kilometers | Select-Object -property estimated_diameter_min, estimated_diameter_max | format-list

    display-line(25)
    display-lowsubtitle("Close Approach")
    $response.near_earth_objects[$option].close_approach_data | Select-Object -property `
            @{Name="Date"; Expression={$_.close_approach_date_full}}, @{Name='Velocity (km/s)'; Expression={$_.relative_velocity.kilometers_per_hour}}, @{Name='Miss distance (km)'; Expression={$_.miss_distance.kilometers}}
    

}