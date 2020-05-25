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



## set up dynamic dns

Look at "quick cron example".

## ssh server

Add ssh key to `~/.ssh/authorized_keys`.

```
# SSH keys
rsync -av $SERVER:$HOME/.ssh .
```

Disable SSH password login in `/etc/ssh/sshd_config` by setting
`PasswordAuthentication no`.

## set up a ssh key

```
ssh-keygen -t ed25519 -a 100
```

Note that the `-a 100` is the number of rounds of the KDF to use, so it doesn't
matter for an unencrypted key.

Add `~/.ssh/id_ed25519.pub` to GitHub account.

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