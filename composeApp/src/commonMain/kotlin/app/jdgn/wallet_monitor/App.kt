package app.jdgn.expense_monitor

import androidx.compose.runtime.*
import app.jdgn.expense_monitor.src.Navigation
import app.jdgn.expense_monitor.ui.theme.AppTheme
import org.jetbrains.compose.ui.tooling.preview.Preview

@Composable
@Preview
fun App() {
    AppTheme {
        Navigation()
    }
}