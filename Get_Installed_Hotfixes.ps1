################################################################################
################################################################################
## Script description                                                         ##
##                                                                            ##
## Name      : Get_Installed_Hotfixes.ps1                                     ##
## Version   : 0.1                                                            ##
## Date      :04/01/2016                                                      ##
## Language  : PowerShell cmd-lets                                            ##
## License   : MIT                                                            ##
## Owner     : M.G                                                            ##
## Authors   : M.G                                                            ##
################################################################################
################################################################################

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
