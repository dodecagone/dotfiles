# Table of Contents
* [Introduction](#introduction)
* [Installation](#installation)
* [The End](#the-end)
* [Troubleshooting](#troubleshooting)
* [Speedrunning](#speedrunning-any)

# Introduction
## Why and what is it for
I dislike having my computer clogged with packages and softwares. 
I like to often reset my computer and start from a fresh Debian12 bookworm install. 
This time I wanted to give `i3` a try (after using `gnome` for a while), and minimize the excedent packages.

This repo is aimed at giving a simple and quick guide for seting up a **minimalistic** and **usable** `i3wm` env from a *headless* Debian12 installation.

## Overview
* Debian12 *stable* is *very* stable. It's intended for servers. I've used it for 3 years before realising how ununpdated it was, and it was a pain to install anyting updated. 
  At first, we will install Debian12 *stable* (aka "bookworm") and then switch the apt sources to *testing* (aka "trixie", it is still stable, do not worry about that). **There is one important step so do not miss it!**
* At first, won't install any desktop environment, so we'll have to setup x11 and i3wm by ourselves. It is very easy, you just have to know the right packages to install (that's why I'm here for :D).
* Once `i3wm` is all set up, you can clone this repo to get my config so you have something not to ugly (hopefully) to start out with.
Not everything I have in my dotfiles is necessary *per se* but it makes things much more pretty/usable for minimal effort.

## Prerequisites
* An Internet connection.
* Backup the files you want to keep. The goal is to start completely headless so we will reset everything.
* Have a Debian12 **stable** (aka "bookworm") installation media ready. See the [debian website](https://www.debian.org/releases/stable/i386/ch02s04.en.html) for more info if you don't know how.
* I expect you to know how to use `vi` or `nano` because we won't have any graphical environment for a little while.
* It shouldn't be your first time toying with a Debian-based distribution. It is not too advanced but I will not detail *everything* (I'll link the documentations if needed).

# Installation
## Installing Debian
Check the [official step-by-step guide](https://debian-handbook.info/browse/stable/sect.installation-steps.html) if you need to.
* Shutdown you computer, plug your installation media and boot from it.
* Follow the whole installation process until you end up on the [Software selection](https://debian-handbook.info/browse/stable/images/inst-tasksel.png) tab. Here, only check `standard system utilities`.
* Finish the installation process, unplug the media and reboot.

## Updating to Debian testing (aka "trixie")
When you boot, you will have essentially nothing but a terminal. Log in as the user you created during the installation process. Then we'll change the apt sources.
* Get root access by typing
  ```
  su -
  ```
  and then the root password.
* Go into `sources.list` and change the sources to "trixie".

  To do so, type
    ```
    vi /etc/apt/sources.list
    ```
  From there (in `vi`, I don't know for `nano`), type:
    ```
    :%s/bookworm/trixie/g
    ```
   and press `Enter`.

  It should have replaced every "bookworm" occurence with "trixie" in the file. If not, well do it by hand I don't know.

  Type `:wq` to save and quit.
* Update and upgrade your system.

  To do so, type
  ```
  apt update
  ```
  to update the new sources, then
  **VERY IMPORTANT** (that's the important step I mentionned), type
  ```
  apt full-upgrade
  ```
  (if you don't do that, nothing will work when you restart your computer and you'd have to reinstall Debian12 all over again).

  For safety, I usually type an 
  ```
  apt update && apt upgrade
  ```
  but it's probably useless.
* Restart you computer. You now have Debian12 testing, which is way more up-to-date (and still very stable, don't worry).

* For quality of life and not have to log in as root everytime, let's quickly set-up `sudo`.
  Same thing as before, type
  ```
  su -
  ```
  and then
  ```
  apt install sudo
  ```
  Then
  ```
  vi /etc/sudoers
  ```
  and find `root      ALL=(ALL:ALL) ALL`. Below, add
  ```
  <user>      ALL=(ALL:ALL) ALL
  ```
  where `<user>` is the name of the user you defined during the installation process.

  Now, `exit` the root console to return to the user, and `sudo` should work (try a `sudo ls` or something).

We're now done with setting up the base. You could theoretically stop here and have a working computer, but please don't.

## Making `i3wm` just work
Now, it's time to install the *bare minimum* to make `i3wm` work. 

To do so, we will need to install `i3`, `x11-xserver-utils`, `pulseaudio`, `xorg`, and `network-manager`.

*Note: I haven't dug, but maybe the* `xorg` *package is not needed in its entirety, and we could get away with only installing some parts of it, but it doesn't feel worth. I once tried to do that and ended up with no touchpad support.*

Well, let's install !
```
sudo apt install i3 x11-server-utils pulseaudio brightnessctl xorg network-manager
```
Then, you should be able to type
```
startx
```
and `i3wm` should start !

A window should open, asking you if you want to create an `i3` config file (yes you do), and to chose a `mod` key (adice: use `super`, since `alt` will interfere with softwares' shortcuts).
Now you have a black screen and an ugly bar at the bottom. 

You can press `mod+Return` to open up a terminal (don't worry if the terminal is gruesome, we will change it right away).
Press `mod+Shift+Q` (or `A` depending on your locale) to close it. 

Press `mod+Shift+E` to close the session and return to our cool, empty, and cold terminal.

## Cool packages
It's time to install actual packages. 
```
sudo apt install curl git feh alacritty vim firefox-esr
```
`feh` will be our background manager, and `alacritty` our terminal emulator. Feel free to use other ones if you prefer. I like these ones because they are light and feel minimalistic, and are easy to configure.

* Let's change the base terminal. Go into the `i3` config file 
  ```
  vim .config/i3/config 
  ```
  look for the line `bindsym $mod+Return exec i3-sensible-terminal`, and replace `i3-sensible-terminal` with `alacritty` (or whatever else you installed).

  Now save the file and type `startx` to load `i3` again.

  Now, pressing `mod+Return` in `i3` should open `alacritty` !
  
  *Pro tip: when editing .config/i3/config, saving and pressing* `mod+Shift+R` *reloads `i3` and applies the changes. No need to quit reload `i3`. It's great. You will use it.*

# The End
That's pretty much it. Now you have a super basic config that you can customise to your liking. The documentation for `i3` can be found [here](https://i3wm.org/docs/).

You can check out [addy-dclxvi's work](https://github.com/addy-dclxvi/i3-starterpack/) for setting up a basic-but-not-too-ugly `i3` config, or use my files.

# Troubleshooting
I have no knowledge so I can't help you but for ONE thing that drove me crazy. 

## nmcli list doesn't show wifi / wifi card shown as unmanaged or unavalaible
You should have `NetworkManager` installed (`sudo apt install network-manager`).

* Restart `network-manager` with
  ```
  sudo systemctl restart NetworkManager.service```
  ```
* List your network devices with 
  ```
  nmcli dev status
  ```
  It shows you a list of your network devices, and their state. 
  
* **If your device is "unmanaged"**

  Edit the `NetworkManager` config file with
  ```
  sudo vim /etc/NetworkManager/NetworkManager.conf
  ```
  and change `managed` from `false` to `true`. Save and quit. Restart `NetworkManager`.

  Check again if it worked with `nmcli dev status`.
* **If your device is "unavailable"**
  
  Edit the `interfaces` file with 
  ```
  sudo vim /etc/network/interfaces
  ```
  and remove everything (don't remove the file, only its content). Save and quit. Restart **your computer**.

If you've got the same problem as I did multiple times, `ncmli dev wifi list` should now show a list of available network and `nmcli dev wifi connect <name> [-a]` works. 


# Speedrunning any%
This section is just a very quick summary of my setup guide, in case you already did everything once and just need the main commands (it's mainly intented for me ngl).

As root,
  ```
  vi /etc/apt/sources.list
  ```
  ```
  :s%/bookworm/trixie/g
  ```
  ```
  apt update && apt full-upgrade
  ```
  Restart computer
  
  As root,
  ```
  apt install sudo
  ```
  ```
  vi /etc/sudoers
  ```
  ```
  root      ALL=(ALL:ALL) ALL
  <user>    ALL=(ALL:ALL) ALL
  ```
  Install `i3` and stuff
  ```
  sudo apt install i3 x11-server-utils pulseaudio brightnessctl xorg network-manager curl git vim feh alacritty firefox-esr
  ```
  To fix wifi
  ```
  sudo systemctl restart NetworkManager.service
  ```
  ```
  sudo vim /etc/NetworkManager/NetworkManager.conf
  ```
  and put `managed` to `true`, then
  ```
  sudo vim /etc/network/interfaces
  ```
  and delete everything.
  Then
  ```
  sudo shutdown -r now
  ```
  **Additional packages**
  ```
  sudo apt install picom neofetch
  ```
  

