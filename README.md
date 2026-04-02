# WeeDeeplinkKit

iOS SDK for Universal Links and deferred deep link attribution.

> This package distributes a precompiled XCFramework binary. Source code is not included.

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15+

## Installation

### Swift Package Manager

Add the package to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/Weelorum/WeeDeeplinkKit.git", from: "1.0.0")
]
```

Or in Xcode: **File → Add Package Dependencies** and enter the repository URL.

## Setup

### 1. Configure the SDK

Call this early in your app's lifecycle (e.g. `application(_:didFinishLaunchingWithOptions:)`):
```swift
import WeeDeeplinkKit

WeeDeeplinkSDK.shared.configure(
    apiKey: "dk_live_xxx",
    apiSecret: "sk_live_xxx"
)
```

An optional `baseURL` parameter is available if you need to point to a custom endpoint (default: `https://api.wee-kit.app/api/v1/`):
```swift
WeeDeeplinkSDK.shared.configure(
    apiKey: "dk_live_xxx",
    apiSecret: "sk_live_xxx",
    baseURL: "https://custom.endpoint.com/api/v1"
)
```

### 2. Track Install

Call on each app launch to register the device and receive SDK configuration:
```swift
Task {
    let response = try await WeeDeeplinkSDK.shared.trackInstall()
    print("Is new install: \(response.isNewInstall)")
    print("Deep links enabled: \(response.config.features.deepLinks)")
}
```

`InstallResponse` fields:

| Field | Type | Description |
|---|---|---|
| `success` | `Bool` | Whether the request succeeded |
| `isNewInstall` | `Bool` | `true` on first launch |
| `config` | `SDKConfig` | Server-side SDK configuration |

`SDKConfig` contains `enabled: Bool`, `plan: String`, and `features: SDKFeatures`.  
`SDKFeatures` contains `deepLinks: Bool`, `deferredDeepLinks: Bool`, `analytics: Bool`.

### 3. Check Deferred Deep Link Attribution

Call after launch to check if the user arrived via a deep link clicked before the app was installed. The SDK collects a device fingerprint (screen dimensions, language, and timezone) and sends it to the attribution endpoint.
```swift
Task {
    let attribution = try await WeeDeeplinkSDK.shared.checkAttribution()
    if attribution.matched, let link = attribution.link {
        navigateTo(link.deepPath, customData: link.customData)
    }
}
```

`AttributionResponse` fields:

| Field | Type | Description |
|---|---|---|
| `matched` | `Bool` | Whether a matching click was found |
| `link` | `AttributedLink?` | The matched link data |
| `matchConfidence` | `Int?` | Confidence score of the match |
| `clickTimestamp` | `String?` | When the original link was clicked |
| `timeToAttribution` | `Int?` | Seconds between click and install |

`AttributedLink` contains `deepPath`, `shortCode`, `title?`, `customData?`, and `utmParams?`.

### 4. Handle Universal Links

**SceneDelegate:**
```swift
import WeeDeeplinkKit

func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
    guard userActivity.activityType == NSUserActivityTypeBrowsingWeb,
          let url = userActivity.webpageURL else { return }

    if let data = WeeDeeplinkSDK.shared.handleUniversalLink(url) {
        navigateTo(data.deepPath, customData: data.customData)
    }
}
```

`handleUniversalLink(_:)` returns `DeepLinkData?` with the following fields:

| Field | Type | Description |
|---|---|---|
| `deepPath` | `String` | Full URL path (e.g. `/product/123`) |
| `shortCode` | `String` | First path component of the URL |
| `title` | `String?` | Link title |
| `customData` | `[String: String]?` | Non-UTM query parameters |
| `utmParams` | `UTMParams?` | UTM tracking parameters |

`UTMParams` contains `source?`, `medium?`, `campaign?`, `term?`, and `content?`.

## Error Handling

All async methods throw `WeeKitError`:
```swift
do {
    let attribution = try await WeeDeeplinkSDK.shared.checkAttribution()
} catch WeeKitError.notConfigured {
    // Call configure() first
} catch WeeKitError.apiError(let statusCode, let message) {
    print("API error \(statusCode): \(message ?? "unknown")")
} catch {
    print(error.localizedDescription)
}
```

| Case | Description |
|---|---|
| `notConfigured` | `configure()` was not called before using the SDK |
| `invalidURL` | Malformed base URL passed to `configure()` |
| `networkError(Error)` | Underlying network failure |
| `invalidResponse` | Non-HTTP response received |
| `apiError(statusCode:message:)` | Server returned a non-2xx status |
| `fingerprintFailed(Error)` | Device fingerprint collection failed |

## License

Copyright © Weelorum. All rights reserved.
