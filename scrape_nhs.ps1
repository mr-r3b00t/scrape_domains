$site = "https://www.nhs.uk/servicedirectories/pages/nhstrustlisting.aspx"

$request = iwr -Uri $site -UseBasicParsing

$domainlist = @()

foreach($object in $request.Links){
$object.href
if($object.href -like '*/Services*'){
write-host "Found" -ForegroundColor Green

$domainlist += $object.href
}
else{
#write-host "did not find services"
}


}



$domainlist1 = @()
$pagelist = $domainlist | Sort-Object | sort -Unique

foreach($page in $pagelist){

$site1 = "https://www.nhs.uk$page"

$site1


$request1 = iwr -Uri $site1 -UseBasicParsing

foreach($object in $request1.Links){
$link1 = [System.Uri]$object.href
$domainlist1 += $link1.DnsSafeHost

}

$domainlist1 | Sort-Object -Unique | Out-File C:\users\mrr3b00t\Desktop\nhsdomains.txt






}

