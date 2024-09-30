# Varda Server Setup (Debian)
## Update and install requirements
`sudo apt update; sudo apt upgrade -y; sudo apt install tmux openjdk-17-jre-headless`
## Create the server directory
`sudo mkdir -p /srv/minecraft/varda`
## Create the user
`sudo useradd -r -m -U -d /srv/minecraft -s /bin/bash minecraft`
* -r : system user
* -U : also creates minecraft usergroup
* -d : home directory
* -s : shell
## Take ownership of the directory with the new user
`sudo chown -R minecraft:minecraft /srv/minecraft`
## Create the systemd service
`sudo vim /etc/systemd/system/varda.service`
```
[Unit]
Description=Varda Service
After=local-fs.target network.target

[Service]
Type=forking
Restart=on-failure
Nice=1
KillMode=none
SuccessExitStatus=0 1
ProtectHome=true
ProtectSystem=full
PrivateDevices=true
NoNewPrivileges=true
User=minecraft
Group=minecraft
WorkingDirectory=/srv/minecraft/varda
ExecStart=/usr/bin/tmux -L minecraft new-session -s varda -d '/usr/bin/bash /srv/minecraft/varda/run.sh'
ExecStop=/usr/bin/tmux -L minecraft send-keys -t varda 'say SERVER SHUTTING DOWN IN 10 SECONDS!' ENTER
ExecStop=/usr/bin/sleep 10
ExecStop=/usr/bin/tmux -L minecraft send-keys -t varda 'stop' ENTER

[Install]
WantedBy=multi-user.target
```
## Reload systemd
`sudo systemctl daemon-reload`
## Copy over the server files