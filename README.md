# MobileProvision

A tool to decode *mobileprovision* plist file;

## Environment

- Mini Xcode Version: Xcode 12.0 - beta

## Test

You should set your **Test.mobileprovision** before run test case.

## Usage

### cocoapods

`pod 'K3MobileProvision', 'VERSION'`

### SPM

add `.package(name: "MobileProvision", url: "https://github.com/CrazyFanFan/MobileProvision.git", from: "Version")` to your **Packge.swift.`dependencies`**.

1. To get mobileprovision data as embedded in your app:

```swift
import MobileProvision

MobileProvision.read()
```

1. To get mobile provision data from a file on disk:

```swift
import MobileProvision

MobileProvision.read(from: "path_for_my.mobileprovision")
```
