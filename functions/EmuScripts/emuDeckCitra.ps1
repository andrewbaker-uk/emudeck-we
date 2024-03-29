function Citra_install(){
	showNotification -ToastTitle 'Downloading Citra'
	download $url_citra "citra.zip"
	moveFromTo "citra/nightly-mingw" "tools\EmulationStation-DE\Emulators\citra"
}
function Citra_init(){

	showNotification -ToastTitle 'Citra - Configuration'
	$destination=-join($userFolder, "\AppData\Roaming\Citra")
	mkdir $destination -ErrorAction SilentlyContinue
	copyFromTo "$env:USERPROFILE\EmuDeck\backend\configs\citra" "$destination"
	
	sedFile $destination\config\qt-config.ini "/run/media/mmcblk0p1/Emulation" $EmulationPath
	sedFile $destination\config\qt-config.ini "/" "\"
	
	Citra_setupSaves
}
function Citra_update(){
	echo "NYI"
}
function Citra_setEmulationFolder(){
	echo "NYI"
}
function Citra_setupSaves(){
	showNotification -ToastTitle 'Citra - Saves Links'
	$SourceFilePath = -join($userFolder, '\AppData\Roaming\Citra\sdmc\')
	$ShortcutPath = -join($EmulationPath,'saves\citra\saves.lnk')
	mkdir 'saves\citra' -ErrorAction SilentlyContinue
	mkdir $SourceFilePath -ErrorAction SilentlyContinue
	createLink $SourceFilePath $ShortcutPath
	
	$SourceFilePath = -join($userFolder, '\AppData\Roaming\Citra\states\')
	$ShortcutPath = -join($EmulationPath,'saves\citra\states.lnk')
	mkdir 'saves\citra' -ErrorAction SilentlyContinue
	mkdir $SourceFilePath -ErrorAction SilentlyContinue
	createLink $SourceFilePath $ShortcutPath
}
function Citra_setupStorage(){
	echo "NYI"
}
function Citra_wipe(){
	echo "NYI"
}
function Citra_uninstall(){
	echo "NYI"
}
function Citra_migrate(){
	echo "NYI"
}
function Citra_setABXYstyle(){
	echo "NYI"
}
function Citra_wideScreenOn(){
	echo "NYI"
}
function Citra_wideScreenOff(){
	echo "NYI"
}
function Citra_bezelOn(){
	echo "NYI"
}
function Citra_bezelOff(){
	echo "NYI"
}
function Citra_finalize(){
	echo "NYI"
}
function Citra_IsInstalled(){
	echo "NYI"
}
function Citra_resetConfig(){
	echo "NYI"
}