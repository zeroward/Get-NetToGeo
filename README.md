# Get-NetToGeo
Credit to https://geoip.nekudo.com/ for building this great API I can reference because I'm too lazy to build my own. 

Ever wonder what countires are connecting to your box and you're too lazy to manually locate every single one? 

Neither have I, honestly.. But I needed a reason to work with powershell.

Just run the script and it'll pop out everything you need. For added enjoyment and increased readability, use Get-NetToGeo | Export-CSV -Path "<Path Here>" and it'll kick it out to a nice csv spreadsheet; or don't and be a masochist. 
