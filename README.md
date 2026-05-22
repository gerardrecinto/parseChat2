# Parse Chat

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![Parse](https://img.shields.io/badge/Backend-Parse-purple)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)

A real-time iOS chat app built with Swift and UIKit, using Parse as the backend for authentication and message storage.

## Features

- User sign up and login with error alerts for invalid credentials or existing accounts
- Compose and send messages in real time
- Chronological message feed with dynamic cell height based on message length
- Username shown on each message
- Persistent login across app launches

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift |
| UI | UIKit, Auto Layout |
| Backend | Parse |
| Dependencies | CocoaPods |

## Setup

```bash
git clone https://github.com/gerardrecinto/parseChat2.git
cd parseChat2
pod install
open parseChat.xcworkspace
```

Configure your Parse application ID and server URL in `AppDelegate.swift` before building.

## Demo

![Demo](https://imgur.com/kp8tW39.gif)
