# make a list that can be displayed
# you can input a list through the parameters and it will be automatically numbered

function display-list($list) {
    write-host ""

    $OutputEncoding = [System.Text.Encoding]::UTF16 # set right file format to display lines

    for ($index = 0; $index -lt $list.Length; $index++) { # for loop to add numbers

        $actual_index = $index + 1

        $string = $list[$index] # grab the field from the list in the parameter

        $length = $actual_index.Length

        $line_1 = "┣" + "━" * ($length + 4) + "┳"
        $line_2 = "┃ $actual_index" + " " * ($length) + "    $string"
        $line_3 = "┣" + "━" * ($length + 4) + "┻"
    
        Write-Host $line_1
        Write-Host $line_2
        Write-Host $line_3

    }

    write-host ""

}