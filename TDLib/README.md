# TDLib

This package contains the generated Swift code for interacting with the TDLib JSON interface.

### Packaging TDLib as XCFramework

**You do NOT have to follow the steps below, because the Swift Package will automatically download the prebuilt TDLib binaries. I have written this instruction as a reminder for myself.**

1. Clone the [TDLib repository](https://github.com/tdlib/td) from GitHub and follow the instructions in [example/ios](https://github.com/tdlib/td/blob/master/example/ios/README.md).

   > The **`build.sh`** script can be optionally modified to specify the watchOS deployment target:
   >
   > ```diff
   > if [[ $platform = "watchOS" ]]; then
   > 	ios_platform="WATCH${ios_platform}"
   >   watchos="-DTD_EXPERIMENTAL_WATCH_OS=ON"
   > + watchos="$watchos -DIOS_DEPLOYMENT_TARGET=6.0"
   > fi
   > ```

2. Extract the architectures from the built `tdjson/watchOS/lib/libtdjson.dylib` library:

   ```shell
   lipo libtdjson.dylib -extract armv7k -extract arm64_32 -o watchos/libtdjson.dylib
   lipo libtdjson.dylib -extract x86_64 -extract i386 -o watchos-simulator/libtdjson.dylib
   ```

3. Prepare the `Headers ` folder containg the following files:

   ```
   Headers
   ├── module.modulemap
   ├── td_json_client.h
   ├── td_log.h
   └── tdjson_export.h
   ```

   > The header-files can be copied from `tdjson/watchOS/include/td/telegram`.
   > Note that some `#include` directives inside them should be adjusted.
   >
   > ```c
   > // module.modulemap
   > module TDLibCore {
   >     header "td_json_client.h"
   >     header "td_log.h"
   >     export *
   > }
   > ```

4. Create the XCFramework bundle:

   ```shell
   xcodebuild -create-xcframework \
              -library watchos/libtdjson.dylib \
              -headers Headers \
              -library watchos-simulator/libtdjson.dylib \
              -headers Headers \
              -output TDLibCore.xcframework
   ```

