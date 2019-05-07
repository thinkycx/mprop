# mprop
Use this tool to setprop ro.debuggable 1 and you can debug your apk without change AndroidManifest.xml.
Tool Author @ [netsniffer](https://bbs.pediy.com/user-99439.htm) More info: https://bbs.pediy.com/thread-215311.htm 

Souce code:
- `./jni/mprop.c`

Binary path

- `./obj/local/arm64-v8a/mprop`

# usage 

Just type the follwing command. If you see 1 in the end ,it means you succeeded.
```bash
make build
make run
# internals in Makefile.mk
```


