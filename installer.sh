#!/bin/bash
# Script to automate installation of required tools: JSNinja, Go, and additional bug hunting tools.
# This script will:
#   - Update package lists and install basic dependencies.
#   - Clone and install JSNinja.
#   - Install a fresh version of Go.
#   - Install additional Go tools: gf, gau, uro, katana, and httpx.
#
# Note: Ensure that your GOPATH/bin is in your PATH so that installed Go tools are accessible.

set -e

##############################
# Update system and install dependencies
##############################
echo "[+] Updating package list..."
sudo apt update

echo "[+] Installing required packages: git, python3, python3-pip, wget..."
sudo apt install git python3 python3-pip wget -y

##############################
# Clone and install JSNinja
##############################
echo "[+] Cloning JSNinja repository..."
if [ -d "JSNinja" ]; then
    echo "[*] JSNinja directory exists. Removing it first..."
    rm -rf JSNinja
fi
git clone https://github.com/iamunixtz/JSNinja.git
cd JSNinja

echo "[+] Installing JSNinja requirements..."
pip3 install -r requirements.txt

echo "[+] Copying jsninja to /usr/local/bin..."
sudo cp jsninja /usr/local/bin
chmod +x /usr/local/bin/jsninja

echo "[+] Testing jsninja installation..."
jsninja -h

cd ..

##############################
# Fresh installation of Go
##############################
GO_VERSION="1.20.5"  # Change this to the desired version if needed.
echo "[+] Downloading Go ${GO_VERSION}..."
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz

echo "[+] Removing any previous Go installation..."
sudo rm -rf /usr/local/go

echo "[+] Extracting Go ${GO_VERSION}..."
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.linux-amd64.tar.gz

# Update PATH to include Go if not already done.
if ! grep -q "/usr/local/go/bin" ~/.bashrc; then
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
fi
export PATH=$PATH:/usr/local/go/bin

echo "[+] Go version installed:"
go version

##############################
# Install additional Go-based tools
##############################
echo "[+] Installing additional tools using go install..."
# Ensure the Go binaries directory is in PATH (typically $GOPATH/bin)
export PATH=$PATH:$(go env GOPATH)/bin

# Install gf (a tool for extracting patterns, e.g., for XSS/Sqli)
echo "[+] Installing gf..."
go install github.com/tomnomnom/gf@latest
mv ~/go/bin/gf /usr/local/bin

# Install gau (GetAllUrls) for fetching known URLs from domains.
echo "[+] Installing gau..."
go install github.com/lc/gau/v2/cmd/gau@latest
cp
# Install uro (a URL normalizer/filter) - adjust the repo if needed.
echo "[+] Installing uro..."
go install github.com/hatRiot/uro@latest
mv ~/go/bin/uro /usr/local/bin

# Install katana (for crawling alive URLs)
echo "[+] Installing katana..."
go install github.com/projectdiscovery/katana/cmd/katana@latest
mv ~/go/bin/katana /usr/local/bin

# Install httpx (for probing alive hosts/URLs)
echo "[+] Installing httpx..."
go install github.com/projectdiscovery/httpx/cmd/httpx@latest
mv ~/go/bin/httpx /usr/local/bin

echo "[+] All installations complete."
