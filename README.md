# MCods
### Share your Minecraft server mod files (.jar) simply!
Still in development, there may be bugs.



# Installation
1. [Download from the latest release](https://github.com/JadeMin/MCods/releases/latest).
2. Put it in the same folder as your Minecraft server.
3. Edit the `run` file (which is the server launcher).

## Linux
4. Add a new line `./mcods` after the `java` command like:
```diff
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/linux_args.txt %*
+ ./mcods
```

## Windows 11
4. Add a new line `wt -w 1 mcods` after the `java` command like:
```diff
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
+ wt -w 1 mcods
```
5. Add `wt -w 1` in the `java` command like:
```diff
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
+ wt -w 1 java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
wt -w 1 mcods
```

## Windows 10
4. Add a new line `start mcods` after the `java` command like:
```diff
+ start mcods
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
```
5. Add `start` in the `java` command like:
```diff
start mcods
- java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
+ start java @user_jvm_args.txt @libraries/net/minecraftforge/forge/<version>/win_args.txt %*
```



# Usage
1. Open the `run` file (which is the server launcher), MCods will be started automatically.
2. Share `http://<Your Minecraft server IP>:3000` to your friends.
3. Click the `.jar` files to download.

<!--
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
-->