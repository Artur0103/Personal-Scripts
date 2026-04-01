#!/bin/bash

# ============================================
# Red Team / Pentesting Tools Installer
# For Parrot OS / Kali Linux
# ============================================

set -e

echo "[+] Updating system..."
sudo apt update -y
sudo apt upgrade -y

# ============================================
# Directory setup
# ============================================
mkdir -p ~/tools
cd ~/tools

# ============================================
# GO tools (require Go installed)
# ============================================
echo "[+] Installing Go tools..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install -v github.com/projectdiscovery/katana/cmd/katana@latest
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/projectdiscovery/notify/cmd/notify@latest
go install -v github.com/projectdiscovery/mapcidr/cmd/mapcidr@latest
go install -v github.com/projectdiscovery/asnmap/cmd/asnmap@latest
go install -v github.com/projectdiscovery/tlsx/cmd/tlsx@latest
go install -v github.com/ropnop/kerbrute@latest
go install -v github.com/ffuf/ffuf@latest
go install -v github.com/tomnomnom/unfurl@latest
go install -v github.com/tomnomnom/qsreplace@latest
go install -v github.com/tomnomnom/waybackurls@latest
go install -v github.com/tomnomnom/gf@latest
go install -v github.com/lc/gau/v2/cmd/gau@latest
go install -v github.com/d3mondev/puredns/v2@latest
go install -v github.com/sensepost/gowitness@latest
go install -v github.com/Emoe/kxss@latest
go install -v github.com/hahwul/dalfox/v2@latest

# ============================================
# Python tools (pip)
# ============================================
echo "[+] Installing Python tools..."
pip install --upgrade pip
pip install impacket
pip install mitm6
pip install ldapdomaindump
pip install bloodhound
pip install crackmapexec
pip install certipy-ad
pip install dnspython
pip install aiodnsbrute
pip install requests
pip install paramiko
pip install beautifulsoup4
pip install rich
pip install asyncio
pip install aiohttp
pip install python-nmap
pip install shodan
pip install wfuzz

# ============================================
# NetExec (replacement for CrackMapExec)
# ============================================
echo "[+] Installing NetExec..."
if [ ! -d "netexec" ]; then
    git clone https://github.com/Pennyw0rth/NetExec
    cd NetExec
    pip install .
    cd ~/tools
fi

# ============================================
# Sliver C2
# ============================================
echo "[+] Installing Sliver C2..."
curl -s https://sliver.sh/install | sudo bash

# ============================================
# Viper C2 (Docker)
# ============================================
echo "[+] Installing Viper C2 (Docker)..."
git clone https://github.com/FunnyWolf/Viper
cd Viper
docker-compose up -d
cd ~/tools

# ============================================
# Havoc C2
# ============================================
echo "[+] Building Havoc C2..."
if [ ! -d "Havoc" ]; then
    git clone https://github.com/HavocFramework/Havoc
    cd Havoc
    ./Install.sh
    cd ~/tools
fi

# ============================================
# BloodHound CE (Community Edition)
# ============================================
echo "[+] Installing BloodHound CE..."
if [ ! -d "BloodHound" ]; then
    git clone https://github.com/BloodHoundAD/BloodHound
    cd BloodHound
    docker-compose up -d
    cd ~/tools
fi

# ============================================
# SharpCollection (Windows binaries)
# ============================================
echo "[+] Downloading SharpCollection..."
git clone https://github.com/Flangvik/SharpCollection

# ============================================
# AD PE (Active Directory Privilege Escalation)
# ============================================
echo "[+] Downloading AD PE tools..."
git clone https://github.com/ANSSI-FR/ADPE
git clone https://github.com/SecureAuthCorp/impacket
git clone https://github.com/PowerShellMafia/PowerSploit
git clone https://github.com/gentilkiwi/mimikatz
git clone https://github.com/BC-SECURITY/Empire
git clone https://github.com/byt3bl33d3r/CrackMapExec

# ============================================
# Web application tools
# ============================================
echo "[+] Installing web application tools..."
git clone https://github.com/commixproject/commix
git clone https://github.com/sqlmapproject/sqlmap
git clone https://github.com/urbanadventurer/WhatWeb
git clone https://github.com/s0md3v/XSStrike
git clone https://github.com/angrykoala/eyewitness
git clone https://github.com/assetnote/kiterunner

# ============================================
# Cloud security tools
# ============================================
echo "[+] Installing cloud security tools..."
git clone https://github.com/nccgroup/ScoutSuite
git clone https://github.com/toniblyx/prowler
git clone https://github.com/aquasecurity/trivy
git clone https://github.com/lyft/cartography

# ============================================
# Wordlists
# ============================================
echo "[+] Downloading wordlists..."
mkdir -p ~/wordlists
cd ~/wordlists
git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/berzerk0/Probable-Wordlists.git
git clone https://github.com/fuzzdb-project/fuzzdb.git
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-1000000.txt
cd ~/tools

# ============================================
# Additional tools
# ============================================
echo "[+] Installing additional tools..."
sudo apt install -y \
    bloodhound \
    chisel \
    dsniff \
    feroxbuster \
    flameshot \
    gobuster \
    john \
    jq \
    masscan \
    nbtscan \
    nikto \
    nmap \
    onesixtyone \
    oscanner \
    redis-tools \
    smbclient \
    smbmap \
    snmp \
    sqlmap \
    steghide \
    stegcracker \
    terminator \
    tmux \
    tor \
    wapiti \
    wfuzz \
    whatweb \
    whois \
    wordlists \
    xclip \
    zmap

# ============================================
# Move binaries to PATH
# ============================================
echo "[+] Moving binaries to /usr/local/bin..."
cd ~/tools
find . -type f -executable -name "*.py" -exec chmod +x {} \;
find . -type f -executable -name "*.sh" -exec chmod +x {} \;
find ~/go/bin -type f -executable -exec ln -sf {} /usr/local/bin/ 2>/dev/null || true

# ============================================
# Cleanup
# ============================================
cd ~
sudo apt autoremove -y
sudo apt update -y
sudo apt upgrade -y

echo ""
echo "[+] Installation completed!"
echo "[+] Tools installed in: ~/tools"
echo "[+] Go tools in: ~/go/bin"
echo "[+] Wordlists in: ~/wordlists"
echo ""
echo "=== Installed Tools Summary ==="
echo "  - NetExec (post-exploitation)"
echo "  - Impacket (python library)"
echo "  - Sliver / Viper / Havoc (C2)"
echo "  - BloodHound CE (AD)"
echo "  - Subfinder, Httpx, Nuclei (recon)"
echo "  - Kerbrute, Mimikatz, PowerSploit (AD)"
echo "  - Commix, SQLMap, XSStrike (web)"
echo "  - ScoutSuite, Prowler (cloud)"
echo "  - SecLists, FuzzDB (wordlists)"
