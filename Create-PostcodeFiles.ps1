$postcode_fileData = Import-Csv .\PostcodeData.csv
$postcodeFileLength = $postcode_fileData.$postcodeFileData.Length

 
$newPostcodeList = @()
$recordNumber = 0
[char]$currentLetter = "A"


foreach ($record in $postcode_fileData) {
    $recordNumber += 1
    if ($record.Postcode.SubString(0,1) -ne $currentLetter) {
        $newPostcodeList | Export-Csv "./Data/$($currentLetter)_postcodes.csv" -NoTypeInformation
        $currentLetter = [byte]$currentLetter + 1
        $newPostcodeList = @()

    }

    $newPostcodeList += $record

    if ($recordNumber -eq $postcodeFileLength) {
        $newPostcodeList | Export-Csv "./Data/$($currentLetter)_postcodes.csv" -NoTypeInformation
    }

}

