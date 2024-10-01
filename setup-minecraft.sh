#!/bin/bash
set -euo pipefail

VARDA_RAM=10
VARDA_USR=minecraft
VARDA_ZIP=~/varda-server.zip
VARDA_DIR=/srv/minecraft/varda

# Checks
if [ ! -f "$VARDA_ZIP" ]; then
    echo "varda-server.zip not found..."
    exit 1
fi
if [ ! id "$VARDA_USR" >/dev/null 2>&1 ]; then
    echo "minecraft user not found. Have you run setup-server.sh?"
    exit 1
fi

# Main setup
if [ ! -d "$VARDA_DIR" ]; then
    sudo mkdir -p /srv/minecraft/varda
    sudo unzip "$VARDA_ZIP" -d "$VARDA_DIR"
    #sudo cp start.sh "$VARDA_DIR"
    sudo tee "$VARDA_DIR"/start.sh &>/dev/null <<EOF
    #!/usr/bin/env sh
    /usr/bin/java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.10/unix_args.txt "$@" nogui
    EOF
    echo "eula=true" | sudo tee -a "$VARDA_DIR"/eula.txt
    sudo chown -R minecraft:minecraft /srv/minecraft/varda
    (cd "$VARDA_DIR" && sudo -u minecraft -H sh -c "java -jar forge-*-installer.jar --installServer")
fi

# Forge check
if [ ! -f "$VARDA_DIR"/forge-*-installer.jar.log ]; then
    echo "Forge not installed..."
    exit 1
fi

# Cleanup
if [ -f "$VARDA_DIR"/run.bat ]; then
    sudo rm "$VARDA_DIR"/run.bat
fi
if [ -f "$VARDA_DIR"/run.sh ]; then
    sudo rm "$VARDA_DIR"/run.sh
fi
if [ -f "$VARDA_DIR"/forge-*-installer.jar ]; then
    sudo rm "$VARDA_DIR"/forge-*-installer.jar
fi