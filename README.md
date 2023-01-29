# MCods
### Allows your friends to easily download the same mod files from your Minecraft server folder.
Still in development, so there may be bugs.



# Installation
1. Download [mcods.exe](releases/latest/download/mcods.exe) from the [latest release](releases/latest).
2. Move `mcods.exe` to `%UserProfile%/.mcods/` and add it to PATH.
3. Open editor `run.bat` in your server.

## Windows 11
4. Add a new line `wt mcods` before the `java` command like:
```diff
+ wt mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
5. Add `wt` before the `java` command like:
```diff
wt mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ wt java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```

## Windows 10
4. Add a new line `start mcods` before the `java` command like:
```diff
+ start mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
5. Add `wt` before the `java` command like:
```diff
start mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ start java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```



# Usage
Just open `run.bat` then MCods will use default configs and start the web server.

## If the `mods` folder has a different name or path
1. Open editor `run.bat`.
2. Edit the `mcods` command like:
```diff
- mcods
+ mcods --mods-path <Path to your mods folder>
```



# Advanced Usage
Run `mcods --help` to see all available commands.

## Config IP and port of MCods
These options are NOT REQUIRED!  
MCods defaults to the options below if not specified.
### `server.properties`:
```properties
(...)
mcods-ip=<Same as server-ip>
mcods-port=25585
(...)
```