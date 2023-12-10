# contains function that calls the API and returns the JSON results
# this function gets called in the main file and its result is stored in the $response variable

function load-NasaAPI($api_key) {
    write-host " "
    write-host "[NASA-API Loader] Nasa API is being loaded" # tell the terminal that the API is being loaded

    $url = "https://api.nasa.gov/neo/rest/v1/neo/browse?api_key=$api_key" # inject standard API url (always same)

    write-host "[NASA-API Loader] Nasa API has been loaded succesfully!" # tell terminal that API has been loaded
    
    write-host " "
    return Invoke-RestMethod -Uri $url -Method Get # return the output of the API
}