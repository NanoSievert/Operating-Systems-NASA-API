# create a line of length

function display-line($number) {

    $OutputEncoding = [System.Text.Encoding]::UTF16

    $int = [int]$number
    $string = "━"*$int

    write-host $string
}