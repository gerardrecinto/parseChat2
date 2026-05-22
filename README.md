# Real-Time Chat

![Swift](https://img.shields.io/badge/Swift-3%2B-F05138?logo=swift&logoColor=white)
![iOS 9+](https://img.shields.io/badge/iOS-9%2B-000000?logo=apple&logoColor=white)
![Parse](https://img.shields.io/badge/Backend-Parse-purple)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)

![Demo](docs/assets/demo2.gif)

Real-time iOS chat app using Parse for auth and message storage, with dynamic cell heights and persistent login.

## Features

- Sign up and login with error handling for invalid credentials
- Send and receive messages in real time
- Chronological message feed with dynamic cell height per message length
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
git clone https://github.com/gerardrecinto/parse-realtime-chat-ios.git
cd parse-realtime-chat-ios
pod install
open parseChat.xcworkspace
```

Configure your Parse application ID and server URL in `AppDelegate.swift` before building.
