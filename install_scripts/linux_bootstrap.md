# linux bootstrap

WIP...

maybe group some commands to a bash

## install and configure sudo

```
su
apt install sudo
usermod -aG sudo anish
```

## enable non-free components

Edit `/etc/apt/sources.list` and add `non-free` to the end of all the lines.

## machine-specific

...

## set up dynamic dns

Look at "quick cron example".

## SSH

### set up a ssh key

```
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519
```

 `-a 100` is the number of rounds of the KDF to use: 100 is a balance between speed and safety

`ed25519`  is safer than `ras`. In case some old machine does not support `ed25519`, then also generate  an `rsa` key

* local machine: 
  Use passphrase to keep it safe.

  To check if you have a passphrase and validate it you can run 

```
ssh-keygen -y -f ~/.ssh/id_ed25519
```

* Server side: skip the passphrase

-------



### SSH to GitHub

---

* copy public contents

  ```
  cat ~/.ssh/id_ed25519.pub
  ```

* paste into GitHub

* Verify:

  ```
  ssh -T git@github.com
  ```

  

--------

### ssh for server side

* Send SSH keys to the server

```
ssh-copy-id -i .ssh/id_ed25519.pub user@server
```

Only need to type ssh password once to transfer the public key.  It will be saved in Add ssh key to `~/.ssh/authorized_keys`.

* Config:
  Server side configuration is usually specified in `/etc/ssh/sshd_config`. 
  Here you can make changes like disabling password authentication, changing ssh ports, enabling X11 forwarding, &c. You can specify config settings on a per user basis.
  e.g.  set `PasswordAuthentication no`

## SSH for local machine

### Avoid typing your passphrase every time 

When choosing to add passphrase on local machine, we can use  `ssh-agent` to avoid typing passphrase each time.



### SSH to the server

* ssh config
  Do not use alias to set ssh, instead using config file in `.ssh/config`

  A format is like:

```
Host cressida
    User bx516
    HostName cressida.doc.ic.acuk
    Port 2222
    IdentityFile ~/.ssh/id_ed25519
    LocalForward 9999 localhost:8888

# Configs can also take wildcards
Host *.doc.ic.ac.uk
    User bx516
```



## install programs

```
sudo apt update
sudo apt install \
    curl git mercurial vim htop iotop axel aria2 silversearcher-ag \
    build-essential pkg-config \
    autojump python-pip python-virtualenv python-dev \
    vnstat lm-sensors rsync zsh tmux
```

### scientific computing

```
sudo apt install python-numpy python-scipy \
    gfortran libblas-dev liblapack-dev \
    libjpeg-dev zlib1g-dev python-openc
```

## set default shell

```
chsh -s /usr/bin/zsh
```

## install dotfiles

```
mkdir -p ~/src
cd ~/src
git clone git@github.com:anishathalye/dotfiles
cd dotfiles
./install
cd ~/src
git clone git@github.com:anishathalye/dotfiles-local
cd dotfiles-local
git checkout linux-server
./install

# Dotfiles
git clone https://github.com/binbin-xu/dotfiles.git
cd dotfiles
./install
```

## Install fzf

```
cd $HOME
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Install rg

```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
sudo dpkg -i ripgrep_11.0.2_amd64.deb
```

## gpu setup

```
cd ~/src/dotfiles-local
git checkout gpu
./install
```

* [NVIDIA drivers](http://www.nvidia.com/object/unix.html)
* [CUDA toolkit](https://developer.nvidia.com/cuda-downloads)
    * Get kernel headers first: `sudo apt install linux-headers-$(uname -r)`
    * Using the Ubuntu `.run` file should work
    * Reboot afterwards
* [cuDNN](https://developer.nvidia.com/rdp/cudnn-download)
    * Accelerated Computing Developer Program membership required
    * Copy files to `/usr/local/cuda`