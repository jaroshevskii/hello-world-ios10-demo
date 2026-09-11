# hello-world-ios-demo

iOS 10 "Hello World" demo app built with [Theos](https://theos.dev) for a 32-bit iPad 4 (A6X, `armv7s`) running iOS 10.3.4.

Programmatic UI: `UIViewController` + Auto Layout constraints (no storyboards), full iPad rotation support, launch images, no third-party code signing required on install.

## What's inside

- `main.m` + `HelloWorldDemoAppDelegate.*` — app entry
- `HelloWorldDemoViewController.*` — UI built 100% in code (Auto Layout, centered label, rotation-safe)
- `Resources/Info.plist` — bundle metadata, all iPad orientations, `UILaunchImages`
- `Resources/Default*.png` — white launch screens (768x1024 / 1024x768, incl. @2x)
- `Makefile` — Theos build config

## Requirements

- macOS with Xcode command line tools
- [Theos](https://theos.dev/docs/installation) installed
- iOS 10.3 SDK in `$THEOS/sdks/` (e.g. https://github.com/theos/sdks)
- 32-bit iOS 10 device (iPad 4 / iPhone 5 / iPhone 5c) — or a jailbroken device to install unsigned

## Build

```sh
export THEOS=$HOME/theos
make
# fat binary -> .theos/obj/debug/HelloWorldDemo.app
```

### Build notes (SDK 10.3 + modern clang)

- `ARCHS = armv7 armv7s` — arm64 fails to link (patched tbd files are marked "built for iOS Simulator")
- `HelloWorldDemo_USE_MODULES = 0` — clang modules break on old SDK headers
- `HelloWorldDemo_LDFLAGS = -Wl,-U,_memset` — patched `libsystem_c.tbd` dropped the `_memset` export

## Package as IPA

```sh
rm -rf Payload; mkdir -p Payload
ditto --noextattr --norsrc .theos/obj/debug/HelloWorldDemo.app Payload/HelloWorldDemo.app
COPYFILE_DISABLE=1 zip -rXq HelloWorldDemo.ipa Payload
rm -rf Payload
```

Verify structure with `unzip -l HelloWorldDemo.ipa` — it must contain `Payload/HelloWorldDemo.app/`.

## Install

On a jailbroken device (e.g. via [Socket](https://socket-jb.app)) with [AppSync Unified](https://cydia.akemi.ai/):

```sh
ideviceinstaller install HelloWorldDemo.ipa   # over USB, no Apple ID needed
```

Non-jailbroken: sideload with Sideloadly / Impactor using an Apple ID.