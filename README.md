# MCods
### Allows all players to download mods in your Forge server folder.
Still in development, so there may be bugs.



# Installation
1. Download [mcods.exe](https://github.com/JadeMin/mcods/releases/latest/download/mcods.exe) from the [latest release](https://github.com/JadeMin/MCods/releases/latest).
2. Move `mcods.exe` to `%UserProfile%/.mcods/` and add it to PATH.

## Windows 11
3. Open editor `run.bat` in your server.
4. Add a new line `wt mcods` before `java` command like:
```diff
+ wt mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
5. Add `wt` before `java` command like:
```diff
wt mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ wt java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```

## Windows 10
3. Open editor `run.bat` in your server.
4. Add a new line `start mcods` before `java` command like:
```diff
+ start mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
```
5. Add `wt` before `java` command like:
```diff
start mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
+ start java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<Forge-Version>/win_args.txt %*
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