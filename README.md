# MCods
MCods is a simple, lightweight web server that serve "mods" folder of your server.



# Installation

## Windows 10 / 11
1. Download the latest release from [here]().
2. Extract the zip file.
3. Move `mcods.exe` to `%UserProfile%/.mcods/` and add it to PATH.



# Usage

## Windows 11
1. Open editor `run.bat` of your server.
2. Add a new line `wt mcods` before `java` command like:
```diff
+ wt mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
3. Edit `java` command like:
```diff
wt mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ wt java (...)
```

## Windows 10
1. Open editor `run.bat` of your server.
2. Add a new line `start mcods` before `java` command like:
```diff
+ start mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
3. Edit `java` command like:
```diff
start mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ start java (...)
```



# Advanced Usage
Run `mcods --help` to see all available commands.

## Set ip and port of MCods
Edit `server.properties` like:
```diff
(...)
rcon.port=25575
require-resource-pack=false
resource-pack=
resource-pack-prompt=
resource-pack-sha1=
server-ip=<Your server ip>
server-port=25565

# OPTIONS ARE NOT REQUIRED so MCods will use these as default
+ mcods-ip=<Same as server-ip>
+ mcods-port=25585

simulation-distance=10
spawn-animals=true
spawn-monsters=true
(...)
```