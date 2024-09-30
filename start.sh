#!/usr/bin/env sh
/usr/bin/java -server -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.3.10/unix_args.txt "$@" nogui