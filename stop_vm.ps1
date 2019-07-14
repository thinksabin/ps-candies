## turn off machine under DevOps resource pool, with Name starting Normal_

Import-Module VMware.VimAutomation.Core

#login credentials for vcenter
Set-Variable -Name "username" -Value "username" 
Set-Variable -Name "password" -Value "password"
Set-Variable -Name "vcenterserver" -Value "vcenter.domain"

#connect to vsphere vcenter.domain
Connect-VIServer -Server $vcenterserver -Protocol https -User $username -Password $password

#name of the resource pools
$resourcepools=@("DevOps")

foreach($element in $resourcepools){
Get-Resourcepool -Name $element| Get-VM -Name "Normal_*" | Stop-VM -Confirm:$false -ErrorAction SilentlyContinue
}

