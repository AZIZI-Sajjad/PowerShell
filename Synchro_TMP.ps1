$FolderContent1 = @(Get-ChildItem -Path "D:\tmp\D1") | where {!$_.PSIsContainer}
$FolderContent2 = @(Get-ChildItem -Path "D:\tmp\D2") | where {!$_.PSIsContainer}
$ComparisonResult = Compare-Object -ReferenceObject $FolderContent1 -DifferenceObject $FolderContent2 -Property Name -IncludeEqual
 
$EqualFiles = $ComparisonResult | Where-Object{$_.SideIndicator -eq "=="}
$FilesOnlyInTheFirstFolder =  $ComparisonResult | Where-Object{$_.SideIndicator -eq "<="}
$FilesOnlyInTheSecondFolder = $ComparisonResult | Where-Object{$_.SideIndicator -eq "<="}