if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{ 
$arguments = "& '" + $MyInvocation.MyCommand.Definition + "'"
Start-Process powershell -verb runAs -ArgumentList $arguments
Break

}


Disable-NetAdapter -InterfaceDescription realtek* -Confirm:$false
Enable-NetAdapter -InterfaceDescription realtek* -Confirm:$false
