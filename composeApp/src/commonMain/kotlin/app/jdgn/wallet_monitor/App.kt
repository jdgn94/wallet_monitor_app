package app.jdgn.wallet_monitor

import androidx.compose.runtime.*
import app.jdgn.wallet_monitor.src.Navigation
import app.jdgn.wallet_monitor.ui.theme.AppTheme
import org.jetbrains.compose.ui.tooling.preview.Preview

@Composable
@Preview
fun App() {
    AppTheme {
        Navigation()
    }
}