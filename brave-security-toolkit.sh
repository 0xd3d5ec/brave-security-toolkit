#!/bin/bash

#################################################################################
## Brave Browser Security Toolkit
## Description:
# This script automatically transforms Brave Browser into a penetration testing suite.
# The script mainly focuses on downloading the required extensions for web application penetration testing.

## Version:
# v1.0

## Homepage:
# https://github.com/0xd3d5ec/brave-security-toolkit

## Author:
# D4rkw1ng
#################################################################################

logo() {
    echo ''    
    echo '       ____                           _____                      _ __           ______            __   _ __   '
    echo '      / __ )_________ __   _____     / ___/___  _______  _______(_) /___  __   /_  __/___  ____  / /__(_) /_  '
    echo '     / __  / ___/ __ `/ | / / _ \    \__ \/ _ \/ ___/ / / / ___/ / __/ / / /    / / / __ \/ __ \/ //_/ / __/  '
    echo '    / /_/ / /  / /_/ /| |/ /  __/   ___/ /  __/ /__/ /_/ / /  / / /_/ /_/ /    / / / /_/ / /_/ / ,< / / /_    '
    echo '   /_____/_/   \__,_/ |___/\___/   /____/\___/\___/\__,_/_/  /_/\__/\__, /    /_/  \____/\____/_/|_/_/\__/    '
    echo '                                                                  /____/                                      ' 
    echo '      __                 ____ __       __           ___                                                       '
    echo '     / /_  __  __   ____/ / // / _____/ /___      _<  /___  ____ _                                            '
    echo '    / __ \/ / / /  / __  / // /_/ ___/ //_/ | /| / / / __ \/ __ `/                                            '
    echo '   / /_/ / /_/ /  / /_/ /__  __/ /  / ,<  | |/ |/ / / / / / /_/ /                                             '
    echo '  /_.___/\__, /   \__,_/  /_/ /_/  /_/|_| |__/|__/_/_/ /_/\__, /                                              ' 
    echo '        /____/                                           /____/                                               '
    echo ""
    echo "v1.0"
    echo "github.com/0xd3d5ec"
    echo "twitter.com/d4rkw1ng101010"
}

logo

welcome() {
    echo -e "\n\nUsage:\n\t"
    echo -e "bash $0 run"
    echo -e "\n"
    echo -e '[%%] Available Extensions:'
    echo '* Copy as PlainText'
    echo '* Dark Reader'
    echo '* IP Address and Domain Information'
    echo '* Show My IP Addresses (External and Local)'
    echo '* Proxy Switchy Omega'
    echo '* FoxyProxy Standard'
    echo '* HackBar'
    echo '* iMacros for Chrome'
    echo '* JSONView'
    echo '* Shodan'
    echo '* User-Agent Switcher and Manager'
    echo '* Wappalyzer'
    echo '* Web Developer'
    echo '* Cookie Editor'
    echo '* XML Plus'
    echo '* HackTools'
    echo -e "\n\n"
    echo "[$] Legal Disclaimer: Usage of Brave Browser Security Toolkit for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state, and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program."
}

if [[ $1 != 'run' ]]; then
    welcome
    exit 0
else
    echo -en "\n\n[#] Click [Enter] to start. "
    read -r
fi

if [[ -z $BRAVEPATH ]]; then
    if [[ ! -z $(which brave) ]]; then
        BRAVEPATH=$(which brave)
    elif [[ "$(uname)" == "Darwin" ]]; then
        BRAVEPATH="/Applications/Brave.app/Contents/MacOS/Brave"
    else
        BRAVEPATH='/usr/bin/brave'
    fi
fi

# Checking whether Brave browser is installed.
if [[ ! -f "$BRAVEPATH" ]]; then
    echo -e "[*] Brave browser does not seem to be installed.\n[*] Quitting..."
    exit 1
fi

echo "[*] Brave browser path: $BRAVEPATH"

# Creating a tmp directory.
scriptpath=$(mktemp -d)
echo -e "[*] Created a tmp directory at [$scriptpath]."

# Inserting an "Installation is Finished" page into $scriptpath.
echo '<!DOCTYPE HTML><html><center><head><h1>Installation is Finished</h1></head><body><p><h2>You can close Brave browser.</h2><h3><i>Brave Security Toolkit</i></h3></p></body></center></html>' > "$scriptpath/.installation_finished.html"

# Downloading packages.
echo -e "[*] Downloading Extensions."

# Copy as PlainText
wget "https://chrome.google.com/webstore/detail/copy-as-plain-text/hmjdnojobglgfjhfdeamomnjdlfcmogl" -O "$scriptpath/copy_as_plaintext.crx" >/dev/null

# Dark Reader
wget "https://chrome.google.com/webstore/detail/dark-reader/eimadpbcbfnmbkopoojfekhnkhdbieeh" -O "$scriptpath/dark_reader.crx" >/dev/null

# IP Address and Domain Information
wget "https://chrome.google.com/webstore/detail/ip-address-and-domain-inf/lhgkegeccnckoiliokondpaaalbhafoa" -O "$scriptpath/ip_address_domain_information.crx" >/dev/null

# Proxy Switchy Omega
wget "https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif" -O "$scriptpath/proxy_switchy_omega.crx" >/dev/null

# FoxyProxy Standard
wget "https://chrome.google.com/webstore/detail/foxyproxy-standard/gcknhkkoolaabfmlnjonogaaifnjlfnp" -O "$scriptpath/foxyproxy_standard.crx" >/dev/null

# HackBar
wget "https://chrome.google.com/webstore/detail/hackbar/ginpbkfigcoaokgflihfhhmglmbchinc" -O "$scriptpath/hackbar_v2.crx" >/dev/null

# iMacros for Chrome
wget "https://chrome.google.com/webstore/detail/imacros-for-chrome/cplklnmnlbnpmjogncfgfijoopmnlemp" -O "$scriptpath/imacros_for_firefox.crx" >/devnull

# JSONView
wget "https://chrome.google.com/webstore/detail/jsonview/gmegofmjomhknnokphhckolhcffdaihd" -O "$scriptpath/jsonview.crx" >/dev/null

# Cookie Editor
wget "https://chrome.google.com/webstore/detail/cookie-editor/hlkenndednhfkekhgcdicdfddnkalmdm" -O "$scriptpath/cookie_editor.crx" >/dev/null

# Shodan
wget "https://chrome.google.com/webstore/detail/shodan/jjalcfnidlmpjhdfepjhjbhnhkbgleap" -O "$scriptpath/shodanio.crx" >/dev/null

# Show My IP Addresses (External and Local)
wget "https://chrome.google.com/webstore/detail/show-my-ip-addresses-exte/opljiobgnagdjikipnagigiacllolpaj" -O "$scriptpath/show_my_ip.crx" >/dev/null

# User-Agent Switcher and Manager
wget "https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg" -O "$scriptpath/user_agent_switcher_and_manager.crx" >/dev/null

# Wappalyzer
wget "https://chrome.google.com/webstore/detail/wappalyzer-technology-pro/gppongmhjkpfnbhagpmjfkannfbllamg" -O "$scriptpath/wappalyzer.crx" >/dev/null

# Web Developer
wget "https://chrome.google.com/webstore/detail/web-developer/bfbameneiokkgbdmiekhjnmfkcnldhhm" -O "$scriptpath/web_developer.crx" >/dev/null

# XML Plus
wget "https://chrome.google.com/webstore/detail/xml-plus/jmhicemblbmkcbonbhkjmflehkmkiidj" -O "$scriptpath/xml_viewer_plus.crx" >/dev/null

# HackTools
wget "https://chrome.google.com/webstore/detail/hack-tools/cmbndhnoonmghfofefkcccljbkdpamhi" -O "$scriptpath/hacktools.crx" >/dev/null

# Checks whether to download user-agent list for User-Agent Switcher add-on.
echo -n "[@] Would you like to download a user-agent list for the User-Agent Switcher add-on? [y/n]: "
read -r useragent_list_answer
useragent_list_answer=$(echo -n "$useragent_list_answer" | tr '[:upper:]' '[:lower:]')

if [[ $useragent_list_answer == 'y' || $useragent_list_answer == 'yes' ]]; then
    wget 'https://techpatterns.com/downloads/firefox/useragentswitcher.xml' -O "$scriptpath/useragentswitcher.xml" >/dev/null
    echo -e "[*] Additional user-agents have been downloaded for the \"User-Agent Switcher\" add-on. You can import it manually. It can be found at: [$scriptpath/useragentswitcher.xml]."
fi

# Messages.
echo -e "[*] Downloading extensions completed.\n"

echo -en "[@@] Click [Enter] to run Brave browser and perform the task. (Note: Brave browser will be restarted) "
read -r
echo -e "[*] Running Brave browser to install the extensions.\n"
echo -e "Click confirm on the prompt, and close Brave browser until all extensions are installed"

# Installing the extensions.
# The process needs to be semi-manual due to Brave browser security policies.
# Stopping Brave browser if it's running.
killall brave &>/dev/null

# Installing the extensions
for extension in "$scriptpath"/*.crx; do
    echo "- $extension"
    "$BRAVEPATH" --load-extension="$extension"
done

"$BRAVEPATH" "$scriptpath/.installation_finished.html"

# In case you need to delete the tmp directory, uncomment the following line.
# rm -rf "$scriptpath"
echo -e "[*] Deleted the tmp directory."

# Function that installs Burp cert
install_burp_cert() {
  echo -n "[@] Would you like to download the Burp Suite certificate? [y/n]. (Note: Burp Suite should be running on your machine): "
  read -r burp_cert_answer
  burp_cert_answer=$(echo -n "$burp_cert_answer" | tr '[:upper:]' '[:lower:]')

  if [[ $burp_cert_answer == 'y' || $burp_cert_answer == 'yes' ]]; then
    echo -n "[@] Enter the Burp Suite proxy listener's port (Default: 8080): "
    read -r burp_port

    if [[ -z $burp_port ]]; then
      burp_port='8080'
    fi

    wget "http://127.0.0.1:$burp_port/cert" -o /dev/null -O "$scriptpath/cacert.der"

    if [ -s "$scriptpath/cacert.der" ]; then
      echo -e "[*] Burp Suite certificate has been downloaded and can be found at [$scriptpath/cacert.der]."
      echo -e "[*] Installing the certificate to Brave browser."

      # Command to install the certificate to Brave (assuming Linux).
      certutil -d sql:$HOME/.pki/nssdb -A -t "C,," -n "Burp Suite Certificate" -i "$scriptpath/cacert.der"

      echo -e "[*] Certificate installation completed. Please restart Brave browser to apply the changes."
    else
      echo "[!] Error: The Burp Suite certificate was not able to be downloaded. You need to perform this task manually."
    fi
  fi
}

# Function that installs ZAP cert
install_zap_cert() {
  echo -n "[@] Would you like to download the OWASP ZAP Proxy certificate? [y/n]. (Note: OWASP ZAP Proxy should be running on your machine): "
  read -r zap_cert_answer
  zap_cert_answer=$(echo -n "$zap_cert_answer" | tr '[:upper:]' '[:lower:]')

  if [[ $zap_cert_answer == 'y' || $zap_cert_answer == 'yes' ]]; then
    echo -n "[@] Enter the OWASP ZAP Proxy listener's port (Default: 8080): "
    read -r zap_port

    if [[ -z $zap_port ]]; then
      zap_port='8080'
    fi

    wget "http://localhost:$zap_port/OTHER/core/other/ca/" -o /dev/null -O "$scriptpath/zaprootca.pem"

    if [ -s "$scriptpath/zaprootca.pem" ]; then
      echo -e "[*] OWASP ZAP Proxy certificate has been downloaded and can be found at [$scriptpath/zaprootca.pem]."
      echo -e "[*] Installing the certificate to the system."

      # Command to install the certificate to the system's trusted root store.
      sudo cp "$scriptpath/zaprootca.pem" /usr/local/share/ca-certificates/zaprootca.crt
      sudo update-ca-certificates

      echo -e "[*] Certificate installation completed. Please restart your applications to apply the changes."
    else
      echo "[!] Error: The OWASP ZAP Proxy certificate was not able to be downloaded. You need to perform this task manually."
    fi
  fi
}

# Prompt user whether they want to install both or individually 
install_certificates() {
  echo -n "[@] Would you like to install any certificates? [y/n]: "
  read -r install_answer
  install_answer=$(echo -n "$install_answer" | tr '[:upper:]' '[:lower:]')

  if [[ $install_answer == 'y' || $install_answer == 'yes' ]]; then
    install_burp_cert
    install_zap_cert
  else
    echo "No certificates will be installed. Exiting."
  fi
}

install_certificates

echo -e "[**] Brave Security Toolkit is finished\n"
echo -e "Have a nice day!"
