
Add-Type -AssemblyName System.Drawing


$imageFiles = gci  "C:\Users\e326706\AppData\Local\Microsoft\Windows\Temporary Internet Files\Enclosure\{20365717-AA59-4CFB-86CF-F0A40506F5E7}" *.jpg
$imageFiles[0].Name

foreach($iFile in $imageFiles)
{
    $fileName = $iFile.FullName
    $fileName

    Set-ItemProperty $fileName IsReadOnly $false
    $image = [System.Drawing.Image]::FromFile($fileName)

    #To get all properties $image.PropertyItems
    $title = [System.Text.Encoding]::UTF8.GetString($image.GetPropertyItem(270).Value)
    $title = $title.Remove($title.length-1)
    $image.Dispose()


    $argsVar = '"{0} - {1}" "{2}" ' -f $title, $iFile.Name, $fileName

    start-process -WindowStyle Hidden -wait -FilePath ".\ImageMagicWrapper.bat"  -ArgumentList $argsVar 
    
    #Start-Sleep -s 10000

}
