# *.csv file path all IP 
$csvPath = "D:\CODE\PowerShell\ping\ip-list.csv"

# Import *.csv file on all IP to ping
$iplist = Import-CSV -Path $csvPath


# function to PING each IP address
function pingIP {
    if ($(ping -n 10 -w 5 $ip > $null; $?)){
    Write-Host "$ip"
    # Write-Host "$ip : up"
    }

    <#
    else {
    Write-Host "$ip : down"
    }
    #>

    }

foreach ($ip in $iplist.device) {
    # Write-Host "IP: $ip"
    pingIP
}
