#!/bin/bash

# CyberOpsDaily setup script for Ubuntu 22.04 VPS

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing Python 3 and pip..."
sudo apt install -y python3 python3-pip python3-venv git

echo "[+] Cloning project..."
git clone https://github.com/getinsi/cyberopsdaily.git
cd cyberopsdaily

echo "[+] Creating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "[+] Installing dependencies..."
pip install -r requirements.txt

echo "[+] Creating folders..."
mkdir -p logs articles data

echo "[+] Add your OpenAI API key to the .env file."
echo "OPENAI_API_KEY=sk-xxxxx" > .env
nano .env

echo "[+] Setup complete. You can now run:"
echo "    source venv/bin/activate && python generate_articles.py"
