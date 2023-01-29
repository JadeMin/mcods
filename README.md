# MCods
### Allows your friends to easily install same mods as your Minecraft server.
Still in development, so there may be bugs.



# Installation
1. Download [mcods.exe](https://github.com/JadeMin/MCods/releases/latest/download/mcods.exe) from the [latest release](https://github.com/JadeMin/MCods/releases/latest).
2. Move `mcods.exe` to `%UserProfile%/.mcods/` and add it to PATH.
3. Open editor `run.bat` in your server.

## Windows 11
4. Add a new line `wt -w 1 mcods` before the `java` command like:
```diff
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ wt mcods
```
5. Add `wt -w 1` before the `java` command like:
```diff
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ wt -w 1 java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
wt mcods
```

## Windows 10
4. Add a new line `start mcods` before the `java` command like:
```diff
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ start mcods
```
5. Add `start` before the `java` command like:
```diff
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ start java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
start mcods
```



# Usage
1. Just open `run.bat` then MCods will use default configs and start the web server.
2. Let your friends open `http://<Your Minecraft server ip>:25585` in the browser.
3. Click mod file names to download.

## If the `mods` folder has a different name or path
1. Open editor `run.bat`.
2. Edit the `mcods` command like:
```diff
- mcods
+ mcods --mods-path <Path to your mods folder>
```



# Advanced Usage
<!--Run `mcods --help` to see all available commands.-->

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