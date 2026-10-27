#!/usr/bin/env bash
# Takes the README screenshots of the example app on an iOS simulator.
#
#   scripts/screenshots.sh
#
# Needs macOS with Xcode and Flutter. The script uses its own simulator
# (FlutterGlass-iPhone18Pro, created on the first run) and leaves every other
# simulator alone. It fixes the status bar at 9:41, builds the example once per
# screen with --dart-define=INITIAL_ROUTE and writes docs/screenshots/*.png.
# The glass is rendered by Impeller on the simulator's Metal device, so the
# blur in the pictures is the real effect, not a mock-up.
set -euo pipefail

cd "$(dirname "$0")/.."
device_name="${DEVICE_NAME:-FlutterGlass-iPhone18Pro}"
device_type="com.apple.CoreSimulator.SimDeviceType.iPhone-18-Pro"
bundle_id="dev.flutterglass.flutterGlassExample"
out="docs/screenshots"

udid="$(xcrun simctl list devices | grep -F "$device_name (" | grep -oE '[0-9A-F-]{36}' | head -n 1 || true)"
if [ -z "$udid" ]; then
  runtime="$(xcrun simctl list runtimes | grep -E '^iOS ' | grep -oE 'com\.apple\.CoreSimulator\.SimRuntime\.iOS-[0-9-]+' | tail -n 1)"
  udid="$(xcrun simctl create "$device_name" "$device_type" "$runtime")"
fi
xcrun simctl boot "$udid" 2>/dev/null || true
xcrun simctl bootstatus "$udid" -b >/dev/null
xcrun simctl status_bar "$udid" override --time 9:41 --batteryState charged --batteryLevel 100 \
  --cellularMode active --cellularBars 4 --wifiBars 3

mkdir -p "$out"
shot() {
  local name="$1" route="$2" appearance="$3"
  xcrun simctl ui "$udid" appearance "$appearance"
  (cd example && flutter build ios --simulator --debug --dart-define=INITIAL_ROUTE="$route" >/dev/null)
  xcrun simctl install "$udid" example/build/ios/iphonesimulator/Runner.app
  xcrun simctl launch --terminate-running-process "$udid" "$bundle_id" >/dev/null
  # Startup, the first frame and, for /sheet, the sheet's entrance.
  sleep 8
  xcrun simctl io "$udid" screenshot --type=png "$out/$name.png" >/dev/null
  sips --resampleWidth 600 "$out/$name.png" >/dev/null
  echo "$out/$name.png"
}

shot surfaces / light
shot surfaces-dark / dark
shot controls /controls light
shot contrast /contrast light
shot sheet /sheet light
xcrun simctl ui "$udid" appearance light
xcrun simctl status_bar "$udid" clear
