#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

# Crée /local et copie /backup dedans

echo 'Déplacement des données...'
cd /Users/tahoe && mkdir Local && cp -R /Volumes/Rick/Backup /Users/tahoe/Local

# Avant de lancer le script : se déconnecter de l'App Store, déplacer le dossier /local de mon ordi principal vers /Users/tahoe

echo 'Allowing apps to be installed from anywhere...'
sudo spctl --master-disable

## La base : Homebrew
if test ! $(which brew)
then
	echo 'Installation de Homebrew'
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Vérifier que tout est bien à jour
brew update

## Utilitaires pour les autres apps : Cask et mas (Mac App Store)
echo 'Installation de mas, pour installer les apps du Mac App Store.'
brew install mas
echo "Saisir le mail du compte iTunes :" 
read COMPTE
echo "Saisir le mot de passe du compte : $COMPTE"
read -s PASSWORD
mas signin $COMPTE "$PASSWORD"

echo 'Installation de Cask, pour installer les autres apps.'
brew tap caskroom/cask

# Installation d'apps avec mas (source : https://github.com/argon/mas/issues/41#issuecomment-245846651)
function install () {
	# Check if the App is already installed
	mas list | grep -i "$1" > /dev/null

	if [ "$?" == 0 ]; then
		echo "==> $1 est déjà installée"
	else
		echo "==> Installation de $1..."
		mas search "$1" | { read app_ident app_name ; mas install $app_ident ; }
	fi
}



	echo "Installations via Homebrew"

echo "Installation de Sublime Text..."
brew cask install sublime-text
open -a 'Sublime Text'

echo "Installation de Telegram..."
brew cask install telegram

echo "Installation de BetterTouchTool..."
brew cask install bettertouchtool
open -a 'BetterTouchTool'

echo "Installation de Slack..."
brew cask install slack

echo "Installation de XLD..."
brew cask install xld

echo "Installation de Firefox..."
brew cask install firefox

echo "Installation de Chromium..."
brew cask install chromium

echo "Installation de GitHub Desktop..."
brew cask install github

echo "Installation de IINA..."
brew cask install iina

echo "Installation de Skitch..."
brew cask install skitch

echo "Installation de Tor..."
brew cask install tor-browser

echo "Installation de KeepingYouAwake..."
brew cask install keepingyouawake

echo "Installation de MAMP..."
brew cask install mamp

echo "Installation de Poedit..."
brew cask install poedit

echo "Installation de Disk Inventory X..."
brew cask install disk-inventory-x

echo "Installation de qBittorrent..."
brew cask install c0re100-qbittorrent

echo "Installation de The Unarchiver..."
brew cask install the-unarchiver

echo "Installation de TeamViewer..."
brew cask install teamviewer

echo "Installation de RDM..."
brew cask install avibrazil-rdm

echo "Installation de iCloud Control..."
brew cask install icloud-control

echo "Installation de Nord VPN..."
brew cask install nordvpn

echo "Installation de Intel Power Gadget..."
brew cask install intel-power-gadget

echo 'Installation de dockutil'
brew install dockutil




	echo "Installations via l'App Store"

echo "Installation de Numbers..."
install "Numbers"

echo "Installation de Pages..."
install "Pages"




	echo "Installations via .pkg"

echo "Installation de 1Password..."
sudo installer -pkg /Users/tahoe/Local/Backup/cracked/*1Password*.pkg  -target /


	echo "Installations via .dmg"

echo "Installation d'Affinity Designer..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Affinity\ Designer*.dmg && cp -R /Volumes/*Affinity\ Designer*/*.app /Applications && hdiutil unmount /Volumes/*Affinity\ Designer*/

echo "Installation d'Affinity Photo..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Affinity\ Photo*.dmg && cp -R /Volumes/*Affinity\ Photo*/*.app /Applications && hdiutil unmount /Volumes/*Affinity\ Photo*/

echo "Installation d'Alfred..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Alfred*.dmg && cp -R /Volumes/*Alfred*/*.app /Applications && hdiutil unmount /Volumes/*Alfred*/
open -a 'Alfred'

echo "Installation de CodeKit..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*CodeKit*.dmg && cp -R /Volumes/*CodeKit*/*.app /Applications && hdiutil unmount /Volumes/*CodeKit*/

echo "Installation de Smooze..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Smooze*.dmg && cp -R /Volumes/*Smooze*/*.app /Applications && hdiutil unmount /Volumes/*Smooze*/

echo "Installation de ScreenFlow..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*ScreenFlow*.dmg && cp -R /Volumes/*ScreenFlow*/*.app /Applications && hdiutil unmount /Volumes/*ScreenFlow*/

echo "Installation de Bartender..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Bartender*.dmg && cp -R /Volumes/*Bartender*/*.app /Applications && hdiutil unmount /Volumes/*Bartender*/
open -a 'Bartender'

echo "Installation de CleanMyMac..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*CleanMyMac*.dmg && cp -R /Volumes/*CleanMyMac*/*.app /Applications && hdiutil unmount /Volumes/*CleanMyMac*/

echo "Installation de iStat Menus... (licence requise)"
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*iStat*.dmg && cp -R /Volumes/*iStat*/*.app /Applications

echo "Installation de JPEG Mini..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*JPEG*.dmg && cp -R /Volumes/*JPEG*/*.app /Applications && hdiutil unmount /Volumes/*JPEG*/

echo "Installation de Paragon NTFS..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Paragon*.dmg && cp -R /Volumes/*Paragon*/*.app /Applications && cp -R /Volumes/*Trial*/*.app /Applications && hdiutil unmount /Volumes/*Paragon*/

echo "Installation de Transmit..."
sudo hdiutil attach /Users/tahoe/Local/Backup/cracked/*Transmit*.dmg && cp -R /Volumes/*Transmit*/*.app /Applications && hdiutil unmount /Volumes/*Transmit*/


	echo "Autres installations"

echo "Installation de Hazel..."
open /Users/tahoe/Local/Backup/cracked/Hazel.prefPane
#&& open /Users/tahoe/Local/Backup/cracked/hazellicense.hazellicense && open /Users/tahoe/Local/Backup/hazel/rules.hazelrules

echo "Installation de Clear..."
sudo cp -R /Users/tahoe/Local/Backup/cracked/*Clear*.app /Applications

echo "Installation de Byword..."
sudo cp -R /Users/tahoe/Local/Backup/cracked/*Byword*.app /Applications




## ************************* CONFIGURATION ********************************
	echo "Configuration des apps"

pkill -x 'Bartender'

echo "Configuration de Sublime Text..."
cp -R /Users/tahoe/Local/Backup/settings/sublimetext/Packages /Users/tahoe/Library/Application\ Support/Sublime\ Text\ 3 && cp -R /Users/tahoe/Local/Backup/settings/sublimetext/Installed\ Packages /Users/tahoe/Library/Application\ Support/Sublime\ Text\ 3

echo "Activation de BetterTouchTool..."
cp /Users/tahoe/Local/Backup/settings/bettertouchtool/bettertouchtool.bttlicense /Users/tahoe/Library/Application\ Support/BetterTouchTool 

echo "Configuration de BetterTouchTool..."
open /Users/tahoe/Local/Backup/settings/bettertouchtool/settings.bttpreset

echo "Configuration de Alfred..."
cp -R /Users/tahoe/Local/Backup/settings/Alfred /Users/tahoe/Library/Application\ Support

echo "Configuration de Firefox..."
cp -R /Users/tahoe/Local/Backup/settings/Firefox /Users/tahoe/Library/Application\ Support

echo "Configuration de Transmit..."
cp -R /Users/tahoe/Local/Backup/settings/Transmit /Users/tahoe/Library/Application\ Support













	echo "Configuration de quelques paramètres par défaut…"

## FINDER

chflags nohidden ~/Library

# Afficher le dossier maison par défaut
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Recherche dans le dossier en cours par défaut
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Coup d'œil : sélection de texte
defaults write com.apple.finder QLEnableTextSelection -bool true

# Ne pas alerter en cas de modification de l'extension d'un fichier
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Pas de création de fichiers .DS_STORE sur les disques réseau et externes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Supprimer l'alerte de quarantaine des applications
defaults write com.apple.LaunchServices LSQuarantine -bool false


## CLAVIER ET TRACKPAD


# Répétition touches plus rapide
sudo defaults write NSGlobalDomain KeyRepeat -int 2
# Délai avant répétition des touches
sudo defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Trackpad : toucher pour cliquer
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Souris : glisser une fenêtre de n'importe où avec ^ + Cmd
defaults write -g NSWindowShouldDragOnGesture -bool true

## APPS

# Safari : menu développeur / URL en bas à gauche / URL complète en haut / Do Not Track / affichage barre favoris
defaults write com.apple.safari IncludeDevelopMenu -int 1
defaults write com.apple.safari ShowOverlayStatusBar -int 1
defaults write com.apple.safari ShowFullURLInSmartSearchField -int 1
defaults write com.apple.safari SendDoNotTrackHTTPHeader -int 1
defaults write com.apple.Safari ShowFavoritesBar -bool true

# TextEdit : .txt par défaut
defaults write com.apple.TextEdit RichText -int 0

# TextEdit : ouvre et enregistre les fichiers en UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4



### Custom

## Dock

# Petits points en dessous d’apps ouvertes
defaults write com.apple.dock show-process-indicators -bool true

# Délais d'affichage du dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Désactive les applications récentes dans le dock
defaults write com.apple.dock show-recents -bool FALSE

echo "Réorganisation du dock..."
# Retire les icônes inutiles
dockutil --remove 'Siri'
dockutil --remove 'Launchpad'
dockutil --remove 'Safari'
dockutil --remove 'Mail'
dockutil --remove 'Contacts'
dockutil --remove 'Calendar'
dockutil --remove 'Notes'
dockutil --remove 'Reminder'
dockutil --remove 'Maps'
dockutil --remove 'Photos'
dockutil --remove 'Messages'
dockutil --remove 'FaceTime'
dockutil --remove 'Pages'
dockutil --remove 'Numbers'
dockutil --remove 'Keynote'
dockutil --remove 'News'
dockutil --remove 'iTunes'
dockutil --remove 'App Store'

# Met les icônes dans le bon sens
dockutil --add /Applications/Firefox.app --before 'System Preferences'
dockutil --add /Applications/Telegram.app --before 'System Preferences'
dockutil --add /Applications/Sublime\ Text.app --before 'System Preferences'
dockutil --add /Applications/CodeKit.app --before 'System Preferences'
dockutil --add /Applications/Slack.app --before 'System Preferences'
dockutil --add /Applications/iTunes.app --before 'System Preferences'
dockutil --add /Applications/Notes.app --before 'System Preferences'

## Screenshots

# Change format screenshot de png à jpg
defaults write com.apple.screencapture type -string “jpg”

# Pas d'ombres dans les screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Nom de base du screenshot
defaults write com.apple.screencapture name -string "screen"

# Met les screenshots sur le bureau
defaults write com.apple.screencapture location /Users/tahoe/Desktop


## Finder

# Grosses icônes dans la sidebar
defaults write -globalDomain NSTableViewDefaultSizeMode -int 3

# Vitesse de Quick Look
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

## Misc

# Active le dark mode
AppleInterfaceStyle -string "Dark"

# Retire le flash quand il y a une erreur
defaults write NSGlobalDomain com.apple.sound.beep.flash -bool false

# Pas de press and hold
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Active le son Funk en erreur
defaults write com.apple.systemsound com.apple.sound.beep.sound -string "/System/Library/Sounds/Funk.aiff"

# Désactive le dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Supprimer le warning avant de supprimer dans iCloud
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false

# Trackpad à trois doigts
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Cache Siri dans le menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false








## ************ Fin de l'installation *********
echo "Finder et Dock relancés… redémarrage nécessaire pour terminer."
killall Dock
killall Finder

echo "Derniers nettoyages…"
brew cleanup
rm -f -r /Library/Caches/Homebrew/*

echo "ET VOILÀ !"
echo "Reste plus qu'à entrer les licences des volumes restants (iStat Menu), configurer Smooze à partir du screenshot danse /sttings, activer Hazel et importer ses règles, importer les serveurs de Transmit."