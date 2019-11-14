#!/bin/sh

## README
# /!\ Ce script d'installation est conçu pour mon usage. Ne le lancez pas sans vérifier chaque commande ! /!\

echo 'Allowing apps to be installed from anywhere...'
sudo spctl --master-enable

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



# Installation manuelle de SearchLink
cd /tmp/ && curl -O http://cdn3.brettterpstra.com/downloads/SearchLink2.2.5.zip && unzip SearchLink2.2.5.zip && cd SearchLink2.2.5 && mv SearchLink.workflow ~/Library/Services/


# DockArt (installation manuelle, faute de mieux)
# cd /tmp/ && curl -O http://www.splook.com/Software/DockArt_files/DockArt2.zip && unzip DockArt2.zip && cd DockArt\ 2.2 && mv DockArt.bundle ~/Library/iTunes/iTunes\ Plug-ins


 

echo "Installations via Homebrew"

echo "Installation de Sublime Text..."
brew cask install sublime-text

echo "Installation de Telegram..."
brew cask install telegram

echo "Installation de BetterTouchTool..."
brew cask install bettertouchtool

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





echo "Installations via l'App Store"

echo "Installation de Numbers..."
install "Numbers"

echo "Installation de Pages..."
install "Pages"






echo "Installations via .pkg"

echo "Installation de 1Password"
sudo installer -pkg /Users/tahoe/Local/cracked/*1Password*.pkg  -target /


echo "Installations via .dmg"

echo "Installation d'Affinity Designer..."
sudo hdiutil attach /Users/tahoe/Local/cracked/*Affinity\ Designer*.dmg && cp -R /Volumes/*Affinity\ Designer*/*Affinity\ Designer*.app /Applications && hdiutil unmount /Volumes/*Affinity\ Designer*/

echo "Installation d'Affinity Photo..."
sudo hdiutil attach /Users/tahoe/Local/cracked/*Affinity\ Photo*.dmg && cp -R /Volumes/*Affinity\ Photo*/*Affinity\ Photo*.app /Applications && hdiutil unmount /Volumes/*Affinity\ Photo*/

echo "Installation de Clear..."
sudo cp -R /Users/tahoe/Local/cracked/*Clear*.app /Applications

echo "Installation de Smooze..."
sudo hdiutil attach /Users/tahoe/Local/cracked/*Smooze*.dmg && cp -R /Volumes/*Smooze*/*Smooze*.app /Applications && hdiutil unmount /Volumes/*Smooze*/

echo "Installation d'Alfred..."
sudo hdiutil attach /Users/tahoe/Local/cracked/*Alfred*.dmg && cp -R /Volumes/*Alfred*/*Alfred*.app /Applications && hdiutil unmount /Volumes/*Alfred*/

echo "Installation de iStat Menus... (licence requise)"
sudo hdiutil attach /Users/tahoe/Local/cracked/*iStat*.dmg && cp -R /Volumes/*iStat*/*iStat*.app /Applications

echo "Installation de JPEG Mini..."
sudo cp -R /Users/tahoe/Local/cracked/*JPEG*.app /Applications








## ************************* CONFIGURATION ********************************
echo "Configuration de quelques paramètres par défaut…"

## FINDER

# Affichage de la bibliothèque
# chflags nohidden ~/Library

# Afficher par défaut en mode colonne
# Flwv ▸ Cover Flow View
# Nlsv ▸ List View
# clmv ▸ Column View
# icnv ▸ Icon View
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Afficher le chemin d'accès
defaults write com.apple.finder ShowPathbar -bool true

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

# Vérifier les mises à jour automatiquement
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Safari : menu développeur / URL en bas à gauche / URL complète en haut / Do Not Track / affichage barre favoris
defaults write com.apple.safari IncludeDevelopMenu -int 1
defaults write com.apple.safari ShowOverlayStatusBar -int 1
defaults write com.apple.safari ShowFullURLInSmartSearchField -int 1
defaults write com.apple.safari SendDoNotTrackHTTPHeader -int 1
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Chrome : désactiver la navigation dans l'historique au swipe
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE

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
com.apple.dock autohide-time-modifier -float 0.3

# Désactive les applications récentes dans le dock
defaults write com.apple.dock show-recents -bool FALSE


## Screenshots

# Change format screenshot de png à jpg
defaults write com.apple.screencapture type -string “jpg”

# Pas d'ombres dans les screenshots
defaults write com.apple.screencapture disable-shadow -bool false

# Nom de base du screenshot
defaults write com.apple.screencapture name -string "screen"


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

# Désactive le scroll naturel
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

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
echo "Reste plus qu'à entrer les licences des volumes restants."