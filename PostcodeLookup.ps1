param (
    [Parameter(Mandatory=$true)]
    [string]$inputPostcode 
)


$postcodeFilename = Get-ChildItem -Path "./data" -Filter "$($inputPostcode.SubString(0,1))_*"
$postcode_fileData = Import-Csv "./data/$postcodeFilename" | Where-Object {[string]$_.Postcode -eq $inputPostcode }

$postcodeInfo = [PSCustomObject]@{ 
    district = $postcode_fileData.District
    parish   = $postcode_fileData.Parish
    country = $postcode_fileData.Country
}



$postcodeInfo | ConvertTo-Json