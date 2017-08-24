# Get hotfixes from a list of computers via powershell 
# Script version 1.0 
# Date : 04/01/2016
# Michael Goulart

# Get Hotfixes installed into a list of computers.    

function Hotfixreport { 
$computers = Get-Content C:\Your.path.here\computers.txt   
$ErrorActionPreference = 'Stop'   
ForEach ($computer in $computers) {  
 
  try  
    { 
Get-HotFix -cn $computer | Select-Object PSComputerName,HotFixID,Description,InstalledBy,InstalledOn | FT -AutoSize 
  
    } 
 
catch  
 
    { 
Write-Warning "System Not reachable:$computer" 
    }  
} 
 
} 
Hotfixreport > "$env:USERPROFILE\Desktop\Hotfixreport.txt"
