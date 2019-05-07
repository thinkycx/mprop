ARCH := arm64-v8a
SDK_VERSION := $(shell adb shell getprop ro.build.version.sdk)

all: build

build: 
	cd jni/
	ndk-build #NDK_PROJECT_PATH=./ APP_BUILD_SCRIPT=./jni/Android.mk APP_ABI=$(ARCH) # APP_PLATFORM=android-$(SDK_VERSION) NDK_APPLICATION_MK=Application.mk

push: build 
	adb push ./obj/local/$(ARCH)/mprop /data/local/tmp
	adb shell chmod 777 /data/local/tmp/mprop

run: push
	adb shell su root "/data/local/tmp/mprop"
	echo "[*] original ro.debuggable:"
	adb shell getprop ro.debuggable
	adb shell su root "setprop ro.debuggable 1" 
	# adb shell su root "setprop ro.debuggable 0" 
	echo "[*] now ro.debuggable:"
	adb shell getprop ro.debuggable

restore: push 
	adb shell su root "/data/local/tmp/mprop -r"

clean:
	rm -rf libs
	rm -rf obj
