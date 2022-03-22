

$Path = "D:\CODE\DevNet\SDA DevNet Lab\DevNet SDA Lab - Basic\DevNet SDA Lab - Get Device's NETCONF - Show Running-Configuration.xml"
$XPath = "/config/native/interface/GigabitEthernet"

$name= Select-Xml -Path $Path -XPath $XPath | ForEach { $_.Node.InnerXML }

$name2 = Select-Xml -Path $Path -XPath $XPath | ForEach { $_.Node.InnerXML }



Write-Output $name
echo "111111111111111111"

Write-Output $name2
echo "222222222222222222"
