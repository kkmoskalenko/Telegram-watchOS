# Telegram watchOS

## Overview

This repository contains the Swift implementation of the standalone Telegram app for watchOS 6. The implementation depends on the [TDLib](https://github.com/tdlib/td) library, so the precompiled library binary is also included.

**Unfortunately, low-level networking APIs in watchOS are disabled by Apple (except for audio streaming  apps), so <u>the app only works correctly on the watchOS Simulator</u>. See the [issue](https://github.com/tdlib/td/issues/1442) for reference.**

### Supported Features

- [x] Logging in via QR Code with support for accounts protected by a 2-Step Verfication password
- [x] Viewing the chat list

### Screenshots

![Logging in via QR Code 1](Screenshots/LogIn_1.png) ![Logging in via QR Code 2](Screenshots/LogIn_2.png)

![Chat List 1](Screenshots/Chats_1.png) ![Chat List 2](Screenshots/Chats_2.png)

## Build Instructions

1. Open the `Config.xcconfig` file and fill in your own `api_id` and `api_hash` (can be obtained at https://my.telegram.org)

2. Open `Telegram.xcodeproj` in the latest Xcode, select a watchOS Simulator as a run destination, then run (⌘R)

> Although the app can be built and run on a physical Apple Watch device (`armv7k` and `arm64_32` architectures), it will not work correctly due to low-level networking limitations of watchOS (see this [issue](https://github.com/tdlib/td/issues/1442)).
>
> Besides, building the app for ARM64 watchOS Simulator (for Mac computers with Apple Silicon) is not supported.

## Building TDLib for watchOS 6

**You do NOT have to follow the steps below, because this repesotiry already contains prebuilt TDLib binaries. I’ve written this instruction as a reminder for myself.**

1. Clone the [TDLib repository](https://github.com/tdlib/td) from GitHub and see the instructions in `example/ios`.

2. Run commands from `example/ios/build-openssl.sh` line-by-line manually, but right after clonning the `Python-Apple-support` repo and switching to the specified commit, edit the `Python-Apple-support/Makefile` starting at line 58:

   ```diff
     # watchOS targets
   - TARGETS-watchOS=watchsimulator.i386 watchos.armv7k
   + TARGETS-watchOS=watchsimulator.i386 watchsimulator.x86_64 watchos.armv7k watchos.arm64_32
     CFLAGS-watchOS=-mwatchos-version-min=4.0
     CFLAGS-watchos.armv7k=-fembed-bitcode
   + CFLAGS-watchos.arm64_32=-fembed-bitcode
     PYTHON_CONFIGURE-watchOS=ac_cv_func_sigaltstack=no
   ```

   > The idea behind this solution is from a GitHub [issue](https://github.com/tdlib/td/issues/745).

3. Edit `CMake/iOS.cmake` starting at line 199:

   ```diff
   elseif (IOS_PLATFORM STREQUAL "WATCHOS")
   -   set (IOS_ARCH "armv7k")
   +   set (IOS_ARCH "armv7k;arm64_32")
   elseif (IOS_PLATFORM STREQUAL "WATCHSIMULATOR")
   -   set (IOS_ARCH "i386")
   +   set (IOS_ARCH "i386;x86_64")
   ```

4. Edit `example/ios/build.sh` at line 59:

   ```diff
   - cmake $td_path $options -DIOS_PLATFORM=${ios_platform} -DCMAKE_TOOLCHAIN_FILE=${td_path}/CMake/iOS.cmake -DCMAKE_INSTALL_PREFIX=../${install}
   + cmake $td_path $options -DIOS_PLATFORM=${ios_platform} -DIOS_DEPLOYMENT_TARGET=6.0 -DCMAKE_TOOLCHAIN_FILE=${td_path}/CMake/iOS.cmake -DCMAKE_INSTALL_PREFIX=../${install}
   ```

5. Run the `example/ios/build.sh` script, but only for the watchOS platform.

   Built library will be stored in `tdjson` directory. It will work on any Apple Watch architecture (`armv7k`, `arm64_32`) and even on a simulator (`i386`, `x86_64`).