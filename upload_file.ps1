#upload file into the remote datastore. Hardcoded drive Q: of the windows machine.

Import-Module VMware.VimAutomation.Core

"Uploading file $env:filename from local windows server to the remote datastore"

Set-Variable -Name "username" -Value "username" 
Set-Variable -Name "password" -Value "password"
Set-Variable -Name "vsphere-server" -Value "myserver.domain"
Set-Variable -Name "vmstoredomain" -Value "vmstore-myserver.domain"
Set-Variable -Name "datastore-name" -Value "san4vol9.myserver.domain"
Set-Variable -Name "folder-name" -Value "DevOps"

#filename from the jenkins job parameter
Set-Variable -Name "filename" -Value $env:filename

#connect to vsphere 
Connect-VIServer -Server $vsphere-server -Protocol https -User $username -Password $password

Copy-DatastoreItem -Item Q:\files\$filename -Destination vmstore:$vmstoredomain\$datastore-name\$folder-name\
