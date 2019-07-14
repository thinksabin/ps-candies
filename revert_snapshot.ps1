Import-Module VMware.VimAutomation.Core

"Hello From Powershell from Jenkins"
"Reverting snapshot of vm: $env:vm_name"
"Reverting the snapshot state named: $env:snapshot_name"

Set-Variable -Name "server" -Value "domain-ip" 
Set-Variable -Name "username" -Value "username" 
Set-Variable -Name "password" -Value "password"

#connect to VSphere domain/ip

Connect-VIServer -Server $server -Protocol https -User $username -Password $password

#revert snapshot of vm
#vm_name and snapshot_name values from the jenkins job parameters
set-vm -vm $env:vm_name -snapshot $env:snapshot_name -Confirm:$false

"Snapshot might have been reverted. Please verify"
