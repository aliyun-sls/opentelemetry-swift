#! /bin/sh

set -o pipefail
set -e

#sh build_xcframework.sh -s "OpenTelemetryApi" -p "iphoneos iphonesimulator appletvos appletvsimulator macosx macosx_catalyst"
#sh build_xcframework.sh -s "OpenTelemetrySdk" -p "iphoneos iphonesimulator appletvos appletvsimulator macosx macosx_catalyst"
sh build_xcframework.sh -s "URLSessionInstrumentation" -p "iphoneos iphonesimulator appletvos appletvsimulator macosx macosx_catalyst"

# remove URLSessionInstrumentation. from .swiftinterface files to remove the URLSessionInstrumentation module references.
# https://forums.developer.apple.com/forums/thread/123253
pushd ./build/URLSessionInstrumentation.xcframework
find . -name "*.swiftinterface" -exec sed -i '' 's/URLSessionInstrumentation\.//g' {} \;
popd
