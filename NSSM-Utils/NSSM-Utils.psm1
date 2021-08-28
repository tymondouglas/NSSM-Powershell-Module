Function Get-NSSMServices{
    $NSSMServices = Get-CimInstance -ClassName win32_service | ?{$_.PathName -match 'nssm'} | Select Name,State
    foreach ($service in $NSSMServices){
        $service | Add-Member -NotePropertyName Application -NotePropertyValue (nssm get $service.Name Application)
    }
    $NSSMServices | Select Name,Application,State

}
