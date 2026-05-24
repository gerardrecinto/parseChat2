# Parse Realtime Chat

![Swift](https://img.shields.io/badge/Swift-6.0-F05138?logo=swift&logoColor=white)
![iOS 16+](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![Parse](https://img.shields.io/badge/Backend-Parse-purple)
![UIKit](https://img.shields.io/badge/UIKit-Auto%20Layout-blue)
![CocoaPods](https://img.shields.io/badge/CocoaPods-Parse-red)

![Demo](docs/assets/demo2.gif)

> iOS chat app with near-real-time message delivery implemented via a 5-second repeating `Timer` that fires `PFQuery.findObjectsInBackground`, keeping the `UITableView` synchronized with the Parse backend without a persistent WebSocket connection.

## Features

- **PFUser Auth with Persistent Session:** `LoginViewController` calls `PFUser.logInWithUsername(inBackground:password:)` and `newUser.signUpInBackground`; on `AppDelegate` launch, `PFUser.current()` is checked to bypass the login screen when a session token already exists.
- **Timer-Driven Message Polling:** `ChatViewController` schedules a `Timer` with a 5-second interval on `viewDidLoad`; each tick fires a `PFQuery` sorted by `createdAt` descending, replaces the local message array, and reloads the table.
- **Dynamic Cell Heights:** `ChatCell` (a `UITableViewCell` subclass) uses Auto Layout with a label that wraps across multiple lines; `tableView.rowHeight = UITableViewAutomaticDimension` and `estimatedRowHeight` let UIKit calculate each row's height from the message text at render time.
- **Message Send with UITextField:** The send button reads `messageTextField.text`, constructs a `PFObject` with the `"text"` and `"user"` keys, and calls `saveInBackground`; the next polling cycle picks up the new message.
- **Chronological Display:** The `PFQuery` applies `addDescendingOrder("createdAt")` server-side; the reversed array maps to table rows so the most recent message appears at the bottom, matching chat conventions.
- **Parse Server URL Configuration:** `AppDelegate` calls `Parse.initialize(with: ParseClientConfiguration)` setting both `applicationId` and `server`; pointing to a self-hosted Parse Server URL means no vendor lock-in to Back4App or Heroku.
- **Error Handling on Auth:** Both login and sign-up paths check the returned `Error?` and present a `UIAlertController` with the `localizedDescription` before proceeding, preventing silent failures from reaching the chat screen.

## Tech Stack

| Layer | Technology |
|---|---|
| Language | Swift 6.0 |
| UI | UIKit, UITableView, UITableViewAutomaticDimension, Auto Layout |
| Backend | Local in-memory store|
| Real-Time Mechanism | `Timer.scheduledTimer` polling at 5-second intervals |
| Auth | PFUser session token persisted by Local in-memory store|
| Dependencies | CocoaPods — Parse |

## Architecture

The storyboard defines `LoginViewController` as the initial controller. `AppDelegate` checks `PFUser.current()` at launch and replaces `window.rootViewController` with the chat navigation stack if a session exists. `ChatViewController` is the sole owner of the message data array and the `Timer`; it conforms to `UITableViewDataSource` and `UITableViewDelegate`. `ChatCell` is a minimal `UITableViewCell` subclass with outlets for the username label and message body label, sized by Auto Layout at runtime.

## Key Implementation

**Session persistence:** `Parse.initialize` runs before any view is loaded; `PFUser.current()` returns the cached `PFUser` from the Keychain if the user previously authenticated, so the app can jump directly to the chat screen without re-authenticating.

**Polling implementation:** `Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(onTimer), userInfo: nil, repeats: true)` holds a strong reference via the run loop; `onTimer` calls `getMessages()`, which executes `query.findObjectsInBackground` and replaces the data source array inside the completion closure before calling `tableView.reloadData()`.

**Dynamic row heights:** Setting `tableView.rowHeight = UITableViewAutomaticDimension` and providing a non-zero `estimatedRowHeight` delegates height calculation to Auto Layout, so cells grow with message length without any `heightForRowAt` override.

## Setup

```bash
git clone https://github.com/gerardrecinto/parse-realtime-chat-ios.git
cd parse-realtime-chat-ios
pod install
open parseChat.xcworkspace
```

Configure Parse server: update `applicationId` and `server` in `AppDelegate.swift` before building.
