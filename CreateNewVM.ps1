$BootDevice     = Read-Host -Prompt "Set VM boot device"
$ServerName     = Read-Host -Prompt "Enter VM Name"
$VMGeneration   = Read-Host -Prompt "Enter VM Generation"
[int]$VMMemoryGB= Read-Host -Prompt "Set VM Memory (GB)"
$VMCPU          = Read-Host -Prompt "Set Number of CPUs"
$NetworkAdapter = Read-Host -Prompt "Set Network Adapter"
$VHDPath        = Read-Host -Prompt "Set VHD Path"
[int]$VHDSizeGB = Read-Host -Prompt "Set VHD Size (GB)" 
$SecureBoot     = Read-Host -Prompt "Secure Boot On/Off"
$ISOPath        = Read-Host -Prompt "Set ISO Path"


$VMMemory  = ((($VMMemoryGB*1024)*1024)*1024)
$VHDSize   = ((($VHDSizeGB*1024)*1024)*1024)


New-VM -BootDevice $BootDevice -Name $ServerName -Generation $VMGeneration -MemoryStartupBytes $VMMemory -SwitchName $NetworkAdapter -NewVHDPath $VHDPath -NewVHDSizeBytes $VHDSize

Set-VMProcessor $ServerName -Count $VMCPU

Set-VMFirmware -VMName $ServerName -EnableSecureBoot $SecureBoot

Set-VMDvdDrive -VMName $ServerName -Path $ISOPath 

