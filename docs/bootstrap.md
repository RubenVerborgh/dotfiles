# Bootstrapping Ubuntu / Raspberry Pi OS
- Host: pibot
- User: Ruben
- SSH port: 2222

## Connection and tools
### Install key
On remote machine:
```bash
copysshkey pibot
ssh pibot
```

### OS updates
```bash
sudo apt update
sudo apt upgrade -y
```

```bash
sudo apt purge -y chromium
sudo apt purge -y rpi-connect
sudo apt autoremove -y
```

### Dotfiles
```bash
sudo apt install -y curl git vim-athena
sudo apt install -y silversearcher-ag
```

```bash
curl https://dot.verborgh.org | bash
touch .hushlogin
```

### SSH and firewall
```bash
sudo vim /etc/ssh/sshd_config
```
and change to:
```conf
Port 2222
```

```bash
sudo systemctl restart sshd
sudo apt install -y ufw
sudo ufw allow 2244/tcp
sudo ufw enable
```

```bash
sudo reboot
```

On host machine:
```bash
vim ~/.ssh/config
```
to add/edit:
```conf
Host pibot
  HostName 10.1.0.100
  User ruben
  Port 2222
```

## Versioned configuration
```bash
sudo mkdir /etc/config
cd /etc/config
sudo chown root:sudo .
sudo chmod g+ws .
sudo setfacl -PRdm u::rwx,g::rwx,o::- .
```

```bash
git init
git config --global --add safe.directory /etc/config
```

## NGINX
```bash
sudo apt install -y nginx
sudo ufw allow http
sudo ufw allow https
```

```bash
cd /etc/config
cp -a /etc/nginx .
g ada
g cam "Add initial NGINX config."
```

```bash
sudo rm -r /etc/nginx
sudo ln -s /etc/config/nginx /etc/nginx
```

```bash
sudo usermod -a -G www-data ruben
exit
```

```bash
sudo ln -s /var/www /www
cd /www
sudo chown -R www-data:www-data .
sudo chmod -R g+ws .
sudo setfacl -PRdm u::rwx,g::rwx,o::- .
```

## Node.js
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
sudo bash !$
sudo apt install -y nodejs
```

## Samba
```bash
sudo apt install -y samba
```

Then edit
```bash
sudo vim /etc/samba/smb.conf
```
to remove `[printers]` and `[print$]` sections,
and to set under `[homes]`:
```
read only = no
create mask = 0660
directory mask = 0770
```

```bash
sudo service smbd restart
sudo ufw allow samba
```

```bash
sudo adduser sambauser
sudo usermod -a -G www-data sambauser
sudo chgrp -R www-data /home/sambauser
sudo chmod -R g+rws /home/sambauser
sudo setfacl -PRdm u::rwx,g::rwx,o::- /home/sambauser
cd /home/sambauser
```

```bash
sudo smbpasswd -a sambauser
```

## Web servers
```bash
cd /www
mkcd project
git init
git config receive.denyCurrentBranch updateInstead
sudo chgrp -R www-data .
sudo chmod -R g+rws .
sudo setfacl -PRdm u::rwx,g::rwx,o::- .
```

```bash
cd /etc/config/systemd
vim project.service
```

```conf
[Unit]
Description=project
After=network.target
StartLimitIntervalSec=0

[Service]
User=www-data
WorkingDirectory=/www/project
ExecStart=/usr/bin/node bin/project.mjs 3000
Restart=always
RestartSec=250ms
RestartSteps=10
RestartMaxDelaySec=60s

[Install]
WantedBy=multi-user.target
```

```bash
sudo ln -s /etc/config/systemd/project.service /etc/systemd/system/
sudo systemctl enable project
```

```bash
sudo service project start
sudo service project status
sudo journalctl -u project.service
```
