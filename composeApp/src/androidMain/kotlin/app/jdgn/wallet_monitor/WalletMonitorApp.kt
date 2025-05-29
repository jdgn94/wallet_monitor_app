package app.jdgn.wallet_monitor

import android.app.Application
import app.wallet_monitor.shared.initKoin
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.logger.Level

class WalletMonitorApp: Application() {
    override fun onCreate() {
        super.onCreate()
        initKoin {
            androidLogger(Level.DEBUG)
            androidContext(this@WalletMonitorApp)
        }
    }
}