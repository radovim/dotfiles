#!/bin/sh

rclone mount --daemon drive:Passwords $HOME/drive --vfs-cache-mode=full
