package app.jdgn.expense_monitor

interface Platform {
    val name: String
}

enum class CurrentPlatform {
    ANDROID, IOS, OTHER
}

expect fun getPlatform(): Platform

expect val currentPlatform: CurrentPlatform