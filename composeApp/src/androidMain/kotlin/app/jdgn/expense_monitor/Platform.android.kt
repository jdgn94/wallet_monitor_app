package app.jdgn.wallet_monitor

import android.os.Build

class AndroidPlatform : Platform {
    override val name: String = "Android ${Build.VERSION.SDK_INT}"
}

actual fun getPlatform(): Platform = AndroidPlatform()
actual val currentPlatform: CurrentPlatform = CurrentPlatform.ANDROID