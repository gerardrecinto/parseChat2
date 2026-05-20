# Parse Chat

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
