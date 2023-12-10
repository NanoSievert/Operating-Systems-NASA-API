# File Imports
. (Join-Path $PSScriptRoot ./moduleLoader.ps1) # load moduleloader from current script path (instead of users path)

# Load (+ Install) Graphical
function load-graphical() {
    load-module("Graphical")
}

