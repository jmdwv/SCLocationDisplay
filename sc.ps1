Write-Host "Star Citizen Getting Closer To Something"
Write-Host "Moving Away" -ForegroundColor red 
Write-Host "Getting Closer" -ForegroundColor green
Write-Host "Really Close" -ForegroundColor Yellow

#where I want to go
$x = 3310489488.075857
$y = -27979401332.704884
$z = -2676280493.708758

#set currents to a value because math
$curx = 0
$cury = 0
$curz = 0
$curdist = 0

#note that the first display may be weird
Write-Host "First display doesn't have enough info, so ignore it and I'll take it out later"
Write-Host "Also uses live data in your clip board, so if you copy something while multitasking, data will be weird"

#get into the endless loop (I doubt I'll actually get right on the point)
do {
Write-Host (Get-Date)
#where I was
$lastx = $curx
$lasty = $cury
$lastz = $curz

#where I am
$array = (Get-Clipboard).split(":").Split(" ")
$curx = $array[3]
$cury = $array[5]
$curz = $array[7]

#Total Distance Away
$lastdist = $curdist
$curdist = [math]::Sqrt([math]::pow($curx - $x,2) + [math]::pow($cury - $y,2) + [math]::pow($curz - $z,2))

#convert the distance to a string that is easier to read
$strCurdist = $curdist.ToString('N0')
if ($curdist -lt 20000) {Write-Host "Distance = $strCurdist" -ForegroundColor yellow}elseif ($curdist -gt $lastdist) {Write-Host "Distance = $strCurdist" -ForegroundColor red}else{Write-Host "Distance = $strCurdist" -ForegroundColor green}

#is X closer?
$diffcurx = $x - $curx
if ($diffcurx -lt 0) {$diffcurx = $diffcurx * -1}
$difflastx = $x - $lastx
if ($difflastx -lt 0) {$difflastx = $difflastx * -1}

$strDiffcurX = $diffcurx.ToString('N0')
if ($diffcurx -lt 10000) {Write-Host "X = $curx      $strDiffcurX away" -ForegroundColor yellow}elseif ($diffcurx -gt $difflastx) {Write-Host "X = $curx      $strDiffcurX away" -ForegroundColor red} else{Write-Host "X = $curx      $strDiffcurX away" -ForegroundColor green}

#is Y closer?
$diffcury = $y - $cury
if ($diffcury -lt 0) {$diffcury = $diffcury * -1}
$difflasty = $y - $lasty
if ($difflasty -lt 0) {$difflasty = $difflasty * -1}

$strDiffcurY = $diffcury.ToString('N0')
if ($diffcury -lt 10000) {Write-Host "Y = $cury      $strDiffcurY away" -ForegroundColor yellow}elseif ($diffcury -gt $difflasty) {Write-Host "Y = $cury      $strDiffcurY away" -ForegroundColor red}else{Write-Host "Y = $cury      $strDiffcurY away" -ForegroundColor green}


#is Z closer?
$diffcurz = $z - $curz
if ($diffcurz -lt 0) {$diffcurz = $diffcurz * -1}
$difflastz = $z - $lastz
if ($difflastz -lt 0) {$difflastz = $difflastz * -1}

$strDiffcurZ = $diffcurz.ToString('N0')
if ($diffcurz -lt 10000) {Write-Host "Z = $curz          $strDiffcurZ away" -ForegroundColor yellow}elseif($diffcurz -gt $difflastz){Write-Host "Z = $curz          $strDiffcurZ away" -ForegroundColor red}else{Write-Host "Z = $curz          $strDiffcurZ away" -ForegroundColor green}

#This loop makes it only update the screen when new data is in the clipboard
do {Start-Sleep 1
    $checkclip = (Get-Clipboard).split(":").Split(" ")
} while ($array[7] -eq $checkclip[7] -and $array[3] -eq $checkclip[3] -and $array[5] -eq $checkclip[5])
} while ($curx -ne $x -and $cury -ne $y -and $curz -ne $z)

#Probably won't happen
Write-Host "Done you area at $curx $cury $curz"
