package app.jdgn.wallet_monitor

enum class CurrentPlatform {
    ANDROID, IOS, OTHER
}

expect val currentPlatform: CurrentPlatform