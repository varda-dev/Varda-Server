# Varda Server Setup
## Debian Server Setup
1. Clone the repo to the server.
  * `git clone https://github.com/varda-dev/Varda-Server.git`
2. Run `./setup-server.sh` to prepare the server. This creates a user, sets up directories and systemd scripts.
### Restart Cronjob
* A restart cronjob is added with `setup-server.sh`. It reboots the server everyday at 3am.
* Adjust to your needs with the VARDA_CRON variable in that script.
## Minecraft Server Setup
1. Clone to the repo to your desktop.
2. Run `prep.bat` to prepare the server files from the Curseforge project.
   * If the Curseforge instance directories aren't in `%userprofile%\curseforge\`, this won't work. Adjust accordingly.
   * This removes unneeded directories, mods, downloads Forge and zips it all up.
3. SCP varda-server.zip over to your home folder.
   * `scp varda-server.zip <IP>:/home/<you>`
4. Run `./setup-minecraft.sh` from the git repo on the server to setup the server files.
5. Adjust `user_jvm_args.txt` to suit your server's maximum usable RAM. e.g. -Xmx4G, -Xmx6G, or -Xmx10G, etc... 
   * `sudo -u minecraft -H sh -c "echo '\n-Xmx10G' >> /srv/minecraft/varda/user_jvm_args.txt"`
6. Start the server via `./start.sh` as the minecraft user once to make sure it all works.
   * `sudo -u minecraft -H sh -c "(cd /srv/minecraft/varda && ./start.sh)"`
## Controlling via systemd
If everything went well above, you can now start and enable the server via the systemd script
* `sudo systemctl enable --now varda.service`
* Connect to it with - `sudo -u minecraft -H sh -c "tmux -L minecraft attach -t varda"`
## Warnings
I haven't implemented much sanity checking in any of the scripts, so just watch out if you run them multiple times, especially the `setup-server.sh` one.  
The others clean up directories they're working in, so nothing untowards should occur.