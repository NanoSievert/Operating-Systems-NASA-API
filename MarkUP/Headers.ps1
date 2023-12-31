# Create the main header
function display-title($title) {
    $length = $title.Length

    $OutputEncoding = [System.Text.Encoding]::UTF16 # set text encoding to UTF16 to make sure the header lines get displayed

    $line_1 = "╔"+('═'*7)+('═'*$length)+('═'*7)+"╗"
    $line_2 = "║"+(' '*7)+(' '*$length)+(' '*7)+"║"
    $line_3 = "║       $title"+(' '*7)+"║"
    $line_4 = "║"+(' '*7)+(' '*$length)+(' '*7)+"║"
    $line_5 = "╚"+('═'*7)+('═'*$length)+('═'*7)+"╝"

    Write-Host $line_1
    Write-Host $line_2
    Write-Host $line_3
    Write-Host $line_4
    Write-Host $line_5
}

# Creates a subtitle

function display-subtitle($title) {
    $length = $title.Length

    $OutputEncoding = [System.Text.Encoding]::UTF16

    $line_1 = "┏"+('━'*7)+('━'*$length)+('━'*7)+"┓"
    $line_2 = "┃"+(' '*7)+(' '*$length)+(' '*7)+"┃"
    $line_3 = "┃       $title"+(' '*7)+"┃"
    $line_4 = "┃"+(' '*7)+(' '*$length)+(' '*7)+"┃"
    $line_5 = "┗"+('━'*7)+('━'*$length)+('━'*7)+"┛"

    Write-Host $line_1
    Write-Host $line_2
    Write-Host $line_3
    Write-Host $line_4
    Write-Host $line_5
}

# Creates a lowsubtitle

function display-lowsubtitle($title) {
    $length = $title.Length

    $OutputEncoding = [System.Text.Encoding]::UTF16

    $line_1 = "┏"+('━'*7)+('━'*$length)+('━'*7)+"┓"
    $line_2 = "┃       $title"+(' '*7)+"┃"
    $line_3 = "┗"+('━'*7)+('━'*$length)+('━'*7)+"┛"

    Write-Host $line_1
    Write-Host $line_2
    Write-Host $line_3
}