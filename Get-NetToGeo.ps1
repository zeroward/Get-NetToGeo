
<# Script to take your Get-NetTCPConnection Remote addresses and runs it against a Geolocating API #>
<# Please send any suggestions to zeroward@outlook.com #>

function Get-RemoteToGeo
{
    $iparry = @()

    Foreach ($ip in (Get-NetTCPConnection).RemoteAddress)
    {
    
        if (-Not ($ip -like "0.0.0.0" -or $ip -like "127.0.0.1" -or $ip -like "::" -or $ip -like "::1"))
        {

        $iparry += $ip

        }

    }

    $iparry = $iparry | Sort-Object -Property @{Expression={$_.Trim()}} -Unique

    Foreach ($ip in $iparry)
    {
        $request = Invoke-RestMethod -Method Get -Uri "http://geoip.nekudo.com/api/$ip"

        [PSCustomObject]@{
        IP        = $request.IP
        City      = $request.City
        Country   = $request.Country.Name
        Code      = $request.Country.Code
        Latitude  = $request.Location.Latitude
        Longitude = $request.Location.Longitude
        TimeZone  = $request.Location.Time_zone
        }
    }

}
