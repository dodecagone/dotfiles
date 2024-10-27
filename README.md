# Introduction
## Why and what is it for
I dislike having my computer clogged with packages and softwares. 
I like to often reset my computer and start from a fresh Debian12 bookworm install. 
This time I wanted to give i3 a try (after using GNOME), and to have 0 excedent packages. 

This repo is aimed at giving a simple and quick guide to set up a **minimalistic** and **usable** i3wm env from a *headless* Debian12 installation.

## Overview
* Debian12 *stable* is *very* stable. It's intended for servers. I've used it for 3 years before realising how ununpdated it was. We will install Debian12 stable (aka "bookworm") and then switch the apt `sources.list` to testing (aka "trixie", it's still stable, don't worry about that). There is one important step so don't miss it!
* At first, we will not install any desktop environment, so we will have to setup x11 and i3wm by ourselves. It is very easy, you just have to know the right packages to install.
* Not everything I have in my dotfiles necessary *per se* but it makes things much more pretty/usable.

## Prerequisites
* An Internet connection.
* Backup the files you want to keep. The goal is to start completely headless so we will reset everything.
* Have a Debian12 **stable** (aka "bookworm") installation media ready. See [debian website](https://www.debian.org/releases/stable/i386/ch02s04.en.html) for more info.
* I expect you to know how to use `vi` or `nano` because we will have no graphical environment for a while.
* It shouldn't be your first time toying with UNIX. It is not too advanced but I will not details *everything* (I will link the documentations if needed).

# Installation
## Installing Debian
Check the [official step-by-step guide](https://debian-handbook.info/browse/stable/sect.installation-steps.html) if you need to.
* Shutdown you computer, plug your installation media and boot from it.
* Follow the whole installation process until you end up on the [Software selection](https://debian-handbook.info/browse/stable/images/inst-tasksel.png) tab. Here, only check `standard system utilities`.
* Finish the installation process, unplug the media and reboot.

## Updating to Debian testing (aka "trixie")
When you boot, you will have essentially nothing but a terminal. Log in as the user you created during the installation process.
* Get root access by typing
  ```
  su -
  ```
  and then the root password.
* Go into `sources.list` and change the sources to "trixie".

  To do so, type:
    ```
    vi /etc/apt/sources.list
    ```
  From there (in `vi`, I don't know for `nano`), type:
    ```
    :%s/bookworm/trixie/g
    ```
   and press `Enter`.

  It should have replaced every "bookworm" occurence with "trixie" in the file. If not, well do it yourself.

  Type `:wq` to save and quit.
* Type 
  ```
  apt update
  ```
  to update the new sources, then
  **VERY IMPORTANT** (that's the important step I mentionned), type:
  ```
  apt full-upgrade
  ```
  (if you don't do that, nothing will work when you restart your computer and you'd have to restart all over again).
  For safety, I usually type an 
  ```
  apt update && apt upgrade
  ```
  but it's probably useless.
* Restart you computer. You know have Debian12 testing, which is way more up-to-date (and still very stable, don't worry).


