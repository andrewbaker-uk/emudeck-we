function Dolphin_install(){
	showNotification -ToastTitle 'Downloading Dolphin'
	download $url_dolphin "dolphin.7z"
	moveFromTo "dolphin\Dolphin-x64" "tools\EmulationStation-DE\Emulators\Dolphin-x64"
}
function Dolphin_init(){
	showNotification -ToastTitle 'Dolphin - Configuration'
	New-Item -Path "tools\EmulationStation-DE\Emulators\Dolphin-x64\portable.txt"
	$destination=-join($userFolder, "\tools\EmulationStation-DE\Emulators\Dolphin-x64\User")
	mkdir $destination -ErrorAction SilentlyContinue
	copyFromTo "$env:USERPROFILE\EmuDeck\backend\configs\Dolphin" "$destination"
	
	#Replace buttons names from SteamOS	
	$path=$destination
	Get-ChildItem $path -Recurse -Filter *.ini | 
	Foreach-Object {
		$originFile = $_.FullName
	
		#Dolphin GC
		sedFile $originFile 'evdev/0/Microsoft X-Box 360 pad 0' 'XInput/0/Gamepad'
		sedFile $originFile 'evdev/0/Microsoft X-Box 360 pad 1' 'XInput/1/Gamepad'
		sedFile $originFile 'evdev/0/Microsoft X-Box 360 pad 2' 'XInput/2/Gamepad'
		sedFile $originFile 'evdev/0/Microsoft X-Box 360 pad 3' 'XInput/3/Gamepad'
		
		sedFile $originFile 'SOUTH' '= Button B'
		sedFile $originFile 'EAST' '= Button A'
		sedFile $originFile 'NORTH' '= Button Y'
		sedFile $originFile 'WEST' '= Button X'
		sedFile $originFile '= TR' '= Trigger L'
		sedFile $originFile '+TR' '+Trigger L'
		#FIX TR on true
		sedFile $originFile '= Trigger Lue' '= Tr'
		sedFile $originFile 'START' 'Start'
		sedFile $originFile '`Axis 1-`' '`Left Y+`'
		sedFile $originFile '`Axis 1+`' '`Left Y-`'
		sedFile $originFile '`Axis 0-`' '`Left X-`'
		sedFile $originFile '`Axis 0+`' '`Left X+`'
		sedFile $originFile '`Axis 4-`' '`Right Y+`'
		sedFile $originFile '`Axis 4+`' '`Right Y-`'
		sedFile $originFile '`Axis 3-`' '`Right X-`'
		sedFile $originFile '`Axis 3+`' '`Right X+`'
		sedFile $originFile '`Full Axis 2+`' '`Shoulder L`'
		sedFile $originFile '`Full Axis 5+`' '`Shoulder R`'
		sedFile $originFile '`Full Axis 2+`' '`Trigger L`'
		sedFile $originFile '`Full Axis 5+`' '`Trigger R`'
		sedFile $originFile '`Axis 7-`' '`Pad N`'
		sedFile $originFile '`Axis 7+`' '`Pad S`'
		sedFile $originFile '`Axis 6-`' '`Pad W`'
		sedFile $originFile '`Axis 6+`' '`Pad E`'
		
		#Dolphin Wii	
		sedFile $originFile 'SELECT' '= Select'
		sedFile $originFile '= TL' '= Shoulder L'
		sedFile $originFile '+TL' '+Shoulder L'
	
	}	
	
	#Bios Path	
	sedFile $destination\Config\Dolphin.ini "/run/media/mmcblk0p1/Emulation/" "$EmulationPath"

	Dolphin_setupSaves
}
function Dolphin_update(){
	echo "NYI"
}
function Dolphin_setEmulationFolder(){
	echo "NYI"
}
function Dolphin_setupSaves(){
	showNotification -ToastTitle 'Dolphin - Creating Saves Links'
	#Saves GC
	$SourceFilePath = -join($userFolder, '\tools\EmulationStation-DE\Emulators\Dolphin-x64\User\GC')
	$ShortcutPath = -join($EmulationPath,'saves\dolphin\GC.lnk')
	mkdir 'saves\dolphin' -ErrorAction SilentlyContinue
	mkdir $SourceFilePath -ErrorAction SilentlyContinue
	createLink $SourceFilePath $ShortcutPath
	
	#Saves Wii
	$SourceFilePath = -join($userFolder, '\tools\EmulationStation-DE\Emulators\Dolphin-x64\User\Wii')
	$ShortcutPath = -join($EmulationPath,'saves\dolphin\Wii.lnk')
	mkdir 'saves\dolphin' -ErrorAction SilentlyContinue
	mkdir $SourceFilePath -ErrorAction SilentlyContinue
	createLink $SourceFilePath $ShortcutPath
	
	#States
	$SourceFilePath = -join($userFolder, '\tools\EmulationStation-DE\Emulators\Dolphin-x64\User\StateSaves')
	$ShortcutPath = -join($EmulationPath,'saves\dolphin\states.lnk')
	mkdir $SourceFilePath -ErrorAction SilentlyContinue
	createLink $SourceFilePath $ShortcutPath
}
function Dolphin_setupStorage(){
	echo "NYI"
}
function Dolphin_wipe(){
	echo "NYI"
}
function Dolphin_uninstall(){
	echo "NYI"
}
function Dolphin_migrate(){
	echo "NYI"
}
function Dolphin_setABXYstyle(){
	echo "NYI"
}
function Dolphin_wideScreenOn(){
	echo "NYI"
}
function Dolphin_wideScreenOff(){
	echo "NYI"
}
function Dolphin_bezelOn(){
	echo "NYI"
}
function Dolphin_bezelOff(){
	echo "NYI"
}
function Dolphin_finalize(){
	echo "NYI"
}
function Dolphin_IsInstalled(){
	echo "NYI"
}
function Dolphin_resetConfig(){
	echo "NYI"
}