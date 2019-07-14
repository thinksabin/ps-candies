#remove vm permanently with base_vmname and vmcount. eg: myvm10

Import-Module VMware.VimAutomation.Core

#get ip username and password from jenkins job parameters
Connect-VIServer -Server $env:serverip -User $env:username -Password $env:password

#vmcount value from jenkins job parameter
foreach ($i in 5..$env:vmcount) {

$vmname=$base_vmname+$i

Remove-VM $vmname -DeletePermanently -Confirm:$false
} 

