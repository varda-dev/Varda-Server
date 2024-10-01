# Varda Server Setup (Debian)
1. Close the repo to the server.
  * `git clone https://github.com/varda-dev/Varda-Server.git`
2. Run `./setup-server.sh` to prepare the server. This creates a user, sets up directories and systemd scripts.
# Minecraft Server Setup
1. Clone to the repo to your desktop.
2. Run `prep.bat` to prepare the server files from the Curseforge project.
   * If the Curseforge instance directories aren't in `%userprofile%\curseforge\`, this won't work. Adjust accordingly.
   * This removes unneeded directories, mods, downloads Forge and zips it all up.
3. SCP varda-server.zip over to your home folder.
   * `scp varda-server.zip <IP>:/home/<you>`
4. Run `./setup-minecraft.sh` from the git repo on the server to setup the server files.
5. Start the server via `./start.sh` as the minecraft user once to make sure it all works.
   * `sudo -u minecraft -H sh -c "(cd /srv/minecraft/varda && ./start.sh)"`