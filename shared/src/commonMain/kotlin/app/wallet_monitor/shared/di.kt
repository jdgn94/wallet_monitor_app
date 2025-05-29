package app.wallet_monitor.shared

import org.koin.core.context.startKoin
import org.koin.core.module.Module
import org.koin.core.qualifier.named
import org.koin.dsl.KoinAppDeclaration
import org.koin.dsl.module

val appModule = module {
    single(named("baseUrl")) { "http://your-api-url.com" }
}

val dataModule = module {  }

val viewModel = module {  }

expect val nativeModule: Module

fun initKoin(config: KoinAppDeclaration? = null) {
    startKoin {
        config?.invoke(this)
        modules(appModule, dataModule, viewModel, nativeModule)
    }
}