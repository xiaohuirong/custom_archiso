#!/bin/bash
#wob daemon
rm -f /run/user/1000/wob.sock
mkfifo /run/user/1000/wob.sock
tail -f /run/user/1000/wob.sock | wob &

