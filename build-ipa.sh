#!/bin/bash
# === ??????? iOS IPA ?????? ===
# ??: macOS + Xcode + Node.js
# ??: chmod +x build-ipa.sh && ./build-ipa.sh

set -e

echo "?? ????..."
npm install

echo "?? ??? Capacitor iOS ??..."
npx cap add ios
npx cap sync ios

echo "???  ?? IPA..."
cd ios/App

# ????? (???? AltStore ????)
xcodebuild \
  -workspace App.xcworkspace \
  -scheme App \
  -configuration Release \
  -sdk iphoneos \
  -destination 'generic/platform=iOS' \
  -archivePath build/App.xcarchive \
  archive \
  CODE_SIGNING_ALLOWED=NO \
  CODE_SIGNING_REQUIRED=NO \
  CODE_SIGN_IDENTITY="" \
  DEVELOPMENT_TEAM="" \
  PROVISIONING_PROFILE_SPECIFIER=""

echo "?? ?? IPA..."
mkdir -p Payload
cp -R build/App.xcarchive/Products/Applications/App.app Payload/
zip -r ../../../subnet-calc.ipa Payload
rm -rf Payload

echo "? ??! IPA ??: subnet-calc.ipa"
echo ""
echo "?? ????:"
echo "  1. AltStore (??): ? iPhone ??? AltStore, ????? IPA"
echo "  2. Sideloadly: ?????, USB ?? iPhone ??"
echo "  3. Xcode: ?? iPhone, ??? Xcode ??? (? Apple ID)"
echo "  4. ????: ?? UDID Registrations + ????"
