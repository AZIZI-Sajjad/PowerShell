#echo "**************************************************** GET freeSpace As XML String and Strore in $FreeSpaceXMLString"
function GetStringFreeSpaceXMLString($firstString, $secondString, $importPath){

    #Get content from file
    $file = Get-Content $importPath

    #Regex pattern to compare two strings
    $pattern = "$firstString(.*?)$secondString"

    #Perform the opperation
    $result = [regex]::Match($file,$pattern).Groups[1].Value

    #Return result
    return $result
}
# importPath -> Sensor's Data Path in PRTG server in :
# %programdata%\Paessler\PRTG Network Monitor\Logs\sensors"
# -importPath : Sensor Data File *.txt
$FreeSpaceXMLString = GetStringFreeSpaceXMLString -firstString "  <result>" -secondString "  </result>" -importPath ".\src.txt"
#echo $EXPORT

#echo "***********************************GET Value from Free Space XML String"
function GetValueFromFreeSpaceXMLString($firstString, $secondString){

    #Get content from file
    #$vari = Select-String $variExported

    #Regex pattern to compare two strings
    $pattern = "$firstString(.*?)$secondString"

    #Perform the opperation
    $result = [regex]::Match($FreeSpaceXMLString,$pattern).Groups[1].Value

    #Return result
    return $result

}

#echo "***********************************FUNCTION-2"
[float]$EXPORT2 = GetValueFromFreeSpaceXMLString -firstString "<value>" -secondString "</value>" # -variExported $EXPORT
echo $EXPORT2
$EXPORT2 = $EXPORT2 -replace "\.","\,"
$EXPORT2.GetType()
write-host $EXPORT2
